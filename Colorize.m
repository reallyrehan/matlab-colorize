function n=Colorize(I,ch,name)

%Gray Scale Blurring
 %B=imageResize(I); 
% B=imgaussfilt(B,20);  

%Normal Blurring
 B=imgaussfilt(I,80);

[r c d]=size(I);
while r>1000 || c>1500
    I=imresize(I,0.9);
    B=imresize(B,0.9);
    [r c d]=size(I);
end
IX=I;

[r c d]=size(I);


writerObj = VideoWriter(name);

writerObj.FrameRate = 25;

open(writerObj);

val=0;
u=1;
I2=I;


while val<255
    I=I2;
    if u
        
        val=val+1;
        
        per=(val/255)*100;
        per=floor(per);
        
        if rem(per,10)==0
            per
        end
        
     end
    
        
for i=1:r
    for j=1:c
        pixel=I(i,j,1);
        
        if pixel>val 
            if ch==0
            % WHITING
            I(i,j,1)=255;
             I(i,j,2)=255; 
            I(i,j,3)=255;
            elseif ch==1
             %BLACKING
            I(i,j,1)=0;
              I(i,j,2)=0; 
            I(i,j,3)=0;
            else
            %BLURRING
           I(i,j,1)=B(i,j,1); 
            I(i,j,2)=B(i,j,2); 
            I(i,j,3)=B(i,j,3);
            end
        
        end
        
        
        
    end
end
frame=im2frame(I);
writeVideo(writerObj, frame);



end

for p=0: 80
IX=IX*1.02;
frame=im2frame(IX);
writeVideo(writerObj, frame);
end
I=IX;
[r c d]=size(I);

for counter=0:25
for i=1: r
for j=1: c
if I(i,j,1)<255
I(i,j,1)=I(i,j,1)+10;
if I(i,j,1)>255
    I(i,j,1)=255;
end
end
if I(i,j,2)<255
I(i,j,2)=I(i,j,2)+10;
if I(i,j,2)>255
    I(i,j,2)=255;
end
end
if I(i,j,3)<255
I(i,j,3)=I(i,j,3)+10;
if I(i,j,3)>255
    I(i,j,3)=255;
end
end
end
end
frame=im2frame(I);
writeVideo(writerObj, frame);%ADD FRAME
end




close(writerObj);


        