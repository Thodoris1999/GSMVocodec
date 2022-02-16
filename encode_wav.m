function encode_wav(file)
%ENCODE_WAV Encodes a .wav file
frame_size = 160;
[y,Fs] = audioread(file);
y=y';
frames = length(y)/frame_size;

y_hat = zeros(size(y));
PrevFrmResd = zeros([1 160]); % "initial" residue
% The following 3 lines are a hack to create a struct array. Somehow this
% is hard to do in matlab and there is no good way to preallocate the
% entire array without duplicate definitions since we cannot predefine structs. 
% Also stupid matlab makes arr = [num] a scalar so I can't
% even define a size=1 struct array in peace.
[struct,~] = RPE_frame_coder(y(1:160),PrevFrmResd);
BitStrm = [struct struct];
BitStrm(end) = [];

% encode
for i=1:frames
    frame = y(((i-1)*frame_size+1):(i*frame_size));
    
    [FrmBitStrm,PrevFrmResd] = RPE_frame_coder(frame,PrevFrmResd);
    BitStrm(end+1) = FrmBitStrm;
end

% decode
PrevFrmSTResd = zeros([1 160]); % "initial" residue
for i=1:frames
    FrmBitStrm = BitStrm(i);
    [frame_hat, PrevFrmSTResd] = RPE_frame_decoder(FrmBitStrm,PrevFrmSTResd);
    
    y_hat(((i-1)*frame_size+1):(i*frame_size)) = frame_hat;
end
sound(y_hat,Fs);

plot(y);
hold on;
plot(y_hat);
legend("Original","Encoded/Decoded")
end

