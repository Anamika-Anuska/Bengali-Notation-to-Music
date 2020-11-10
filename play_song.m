function play_song(image,th)
x = load('jansix.mat');

lines=proj_prof(image);
j=size(lines,1)
for(k=1:j)
if (nargin<1)
 word=new(lines{k});
else 
 word=new(lines{k},th);
end
i=size(word,1)
for a=1:i
    w=imresize(word{a},[64 64]);
    b=classify(x.convnet,w)
    %[y, score] = predict(x.categoryClassifier,w);
    %x.categoryClassifier.Labels(y)
    y=double(b);
    Fs = 20000;
        if y==2
        %a=notesexp(622,Fs);
        a=note(622,Fs);
    end
        if y==3
        %a=notesexp(466,Fs);
        a=note(466,Fs);
    end
        if y==4
        %a=notesexp(494,Fs);
        a=note(494,Fs);
    end
    if y==5
        %a=notesexp (698,Fs);
        a=note (698,Fs);
    end
    if y==6
        %a=notesexp(554,Fs);
        a=note(554,Fs);
    end
    if y==7
        %a= notesexp(415,Fs);
        a= note(415,Fs);
    end
    if y==8
        %a= notesexp(370,Fs);
        a= note(370,Fs);
    end
    sound(a)
    pause(1);
    
end
end
end

