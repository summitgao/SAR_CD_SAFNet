clear all;
clc;

load('D:\SAFNet\data\Farm1\mask_test.mat')
load('D:\SAFNet\result.mat')
im_gt = mask_test-1;
imshow(output,[])

[FP,FN,OE,PCC] = DAcom(im_gt, output);

% Save change detection results
fid = fopen('rec.txt', 'a');
fprintf(fid, 'False Alarm   Pixels Number: %d \n', FP);
fprintf(fid, 'Miss Detected Pixels Number: %d \n', FN);
fprintf(fid, 'Overall Error Pixels Number: %d \n', OE);
fprintf(fid, 'PCC :   %f \n\n\n', PCC);
fclose(fid);

fprintf(' ===== Written change detection results to Res.txt ====\n\n');
