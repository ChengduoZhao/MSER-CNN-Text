function savePatches( imageConfig, path )
%savePatches Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    p=0;n=0;
    for i=1:numImages
        patches=imageConfig(i).patches;
        posPatches=patches(:,:,imageConfig(i).labels==1);
        negPatches=patches(:,:,imageConfig(i).labels==0);
%         if 1.5*size(posPatches,3)<size(negPatches,3)
%             negPatches=negPatches(:,:,randperm(size(negPatches,3)));
%             negPatches=negPatches(:,:,1:int64(1.5*size(posPatches,3)));
%         end
        for j=1:size(posPatches,3)
            p=p+1;
            image=posPatches(:,:,j);
            imwrite(image,[path 'positive/' num2str(p) '.jpg']);
        end
        for j=1:size(negPatches,3)
            n=n+1;
            image=negPatches(:,:,j);
            imwrite(image,[path 'negative/' num2str(n) '.jpg']);
        end
%         for j=1:numPatches
%             k=k+1;
%             image=reshape(imageConfig(i).patches(:,:,j),[32 32]);
%             if imageConfig(i).labels(j)==1
%                 imwrite(image,[path 'positive/' num2str(k) '.jpg']);
%             else
%                 imwrite(image,[path 'negative/' num2str(k) '.jpg']);
%             end
%         end
    end
end
