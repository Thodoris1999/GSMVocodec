function encode_audio(file)
%ENCODE_AUDIO Encodes an audio file
frame_size = 160;
[y,Fs] = audioread(file);
if Fs~=8000
    y = resample(y, 8000, Fs); % Resample to 8kbps if needed
    Fs = 8000;
end
y=y';
frames = length(y)/frame_size;

y_hat = zeros(size(y)); % y after coding-decoding
stream = zeros(length(frames), 168); % Allocate stream (176=length of encoded frame)

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

sound(y_hat,Fs);

plot(y);
hold on;
plot(y_hat);
legend("Original","Encoded/Decoded")

audiowrite('out.wav',y_hat,Fs);
end

