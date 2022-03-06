function encode_audio(file)
%ENCODE_AUDIO Encodes an audio file
frame_size = 160;
[y,Fs] = audioread(file);
if Fs~=8000
    y = resample(y, 8000, Fs); % Resample to 8kbps if needed
    Fs = 8000;
end
y=y';
y=round(y*2^12); % Convert to 13-bit signed int as in standard
frames = length(y)/frame_size;
plot(y)

y_hat = zeros(size(y)); % y after coding-decoding
STREAM_SIZE=76;
stream = zeros(length(frames), STREAM_SIZE); % Allocate stream (76=length of encoded frame)

% encode
PrevFrmResd = zeros([1 frame_size]); % "initial" residue
for i=1:frames
    frame = y(((i-1)*frame_size+1):(i*frame_size));
    [FrmBitStrm,PrevFrmResd] = RPE_frame_coder(frame,PrevFrmResd);
    
    stream(i,:) = FrmBitStrm;
end

% decode
PrevFrmSTResd = zeros([1 160]); % "initial" residue
for i=1:frames
    FrmBitStrm = stream(i,:);
    [frame_hat, PrevFrmSTResd] = RPE_frame_decoder(FrmBitStrm,PrevFrmSTResd);
    
    y_hat(((i-1)*frame_size+1):(i*frame_size)) = frame_hat;
end
y_hat=y_hat/2^12; % Convert back to [-1,1]
y=y/2^12; % Convert back to [-1,1]
sound(y_hat,Fs);

plot(y);
hold on;
plot(y_hat);
legend("Original","Encoded/Decoded")

audiowrite('out.wav',y_hat,Fs);
end

