# !/bin/bash

ffmpeg \
    -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/eating-S9-2050-2151_17/real_none.mp4 \
    -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/eating-S9-2050-2151_17/0/fake_none.mp4 \
    -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/eating-S9-2050-2151_17/0/fake_3.mp4 \
    -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/eating-S9-2050-2151_17/0/fake_3_6.mp4 \
    -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/eating-S9-2050-2151_17/0/fake_3_6_16.mp4 \
    -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/eating-S9-2050-2151_17/0/fake_3_6_16_13.mp4 \
    -filter_complex hstack=inputs=6 \
    videos/reconstructed_sequences.mp4 -y

ffmpeg \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/walkdog-S9-1525-1626_17/0/fake_6_13.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/directions-S9-2175-2276_17/0/fake_16_13.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/greeting_2-S11-400-501_17/0/fake_16_13.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/smoking-S9-3475-3576_17/0/fake_13.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/walktogether_1-S11-225-326_17/0/fake_3.mp4 \
    -filter_complex hstack=inputs=5 \
    videos/generalization-pred.mp4 -y

ffmpeg \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/walkdog-S9-1525-1626_17/real.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/directions-S9-2175-2276_17/real.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/greeting_2-S11-400-501_17/real.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/smoking-S9-3475-3576_17/real.mp4 \
    -i videos/renders-several-frames-sample-vs-traj/human3d-data-augmentation/walktogether_1-S11-225-326_17/real.mp4 \
    -filter_complex hstack=inputs=5 \
    videos/generalization-true.mp4 -y 

ffmpeg \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/discussion_2-S9-325-426_17_0/0/fake_3_16.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/greeting-S9-525-626_17_0/0/fake_16_13.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/greeting-S9-1300-1401_17_0/0/fake_6_13.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/smoking-S9-0-101_17_0/0/fake_3_6_16_13.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/walkdog_1-S9-1200-1301_17_0/0/fake_3_6_16.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/walktogether_1-S9-1050-1151_17_0/0/fake_13.mp4 \
    -filter_complex hstack=inputs=6 \
    videos/same-pose-diff-traj-pred.mp4 -y

ffmpeg \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/discussion_2-S9-325-426_17_0/real.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/greeting-S9-525-626_17_0/real.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/greeting-S9-1300-1401_17_0/real.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/smoking-S9-0-101_17_0/real.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/walkdog_1-S9-1200-1301_17_0/real.mp4 \
    -i videos/renders-several-frames-sample-vs-diff-traj/human3d-data-augmentation/walktogether_1-S9-1050-1151_17_0/real.mp4 \
    -filter_complex hstack=inputs=6 \
    videos/same-pose-diff-traj-true.mp4 -y



function concatfinal {
    ffmpeg \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/real_none.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/real_3.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/real_3_6.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/real_3_6_16.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/real_3_6_16_13.mp4 \
        -filter_complex vstack=inputs=5 \
        videos/col-1.mp4 -y

    for ((i=0;i<10;i++)); do
        ffmpeg \
            -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/$i/fake_none.mp4 \
            -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/$i/fake_3.mp4 \
            -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/$i/fake_3_6.mp4 \
            -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/$i/fake_3_6_16.mp4 \
            -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation/walking-S9-0-101_17/$i/fake_3_6_16_13.mp4 \
            -filter_complex vstack=inputs=5 \
            videos/col-$(($i + 2)).mp4 -y
    done
    ffmpeg \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation-deterministic/walking-S9-0-101_17/0/fake_none.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation-deterministic/walking-S9-0-101_17/0/fake_3.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation-deterministic/walking-S9-0-101_17/0/fake_3_6.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation-deterministic/walking-S9-0-101_17/0/fake_3_6_16.mp4 \
        -i videos/renders-single-frame-sample-vs-traj/human3d-data-augmentation-deterministic/walking-S9-0-101_17/0/fake_3_6_16_13.mp4 \
        -filter_complex vstack=inputs=5 \
        videos/col-12.mp4 -y

    cp videos/col-1.mp4 videos/diversity-gt.mp4

    ffmpeg \
        -i videos/col-2.mp4 \
        -i videos/col-3.mp4 \
        -i videos/col-4.mp4 \
        -i videos/col-5.mp4 \
        -i videos/col-6.mp4 \
        -i videos/col-7.mp4 \
        -i videos/col-8.mp4 \
        -i videos/col-9.mp4 \
        -i videos/col-10.mp4 \
        -i videos/col-11.mp4 \
        -filter_complex hstack=inputs=10 \
        videos/diversity-sampled.mp4 -y

    cp videos/col-12.mp4 videos/diversity-deterministic.mp4
    rm videos/col-{1..12}.mp4
}

concatfinal
