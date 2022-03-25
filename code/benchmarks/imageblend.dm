/datum/benchmark/imageblend
    name = "ImageBlend"

    // Duration holders
    var/duration_32 = 0
    var/duration_64 = 0
    var/duration_128 = 0
    var/duration_256 = 0

// Blends 100 icons over eachother, 1000 times. This will test your disk and CPU. Tests 32x32, 64x64, 128x128, 256x256
/datum/benchmark/imageblend/run_benchmark()
    info("Running 32x32")
    var/start32 = world.tick_usage // Should be 0
    for(var/i in 1 to 1000)
        var/icon/master_32 = new('icons/32x32.dmi')
        for(var/j in 1 to 100)
            var/icon/I32 = new('icons/32x32.dmi')
            master_32.Blend(I32)

    var/end32 = world.tick_usage
    duration_32 = end32 - start32
    info("Done 32x32")

    sleep(world.tick_lag) // Let the tick calm down
    info("Running 64x64")
    var/start64 = world.tick_usage // Should be 0
    for(var/i in 1 to 1000)
        var/icon/master_64 = new('icons/64x64.dmi')
        for(var/j in 1 to 100)
            var/icon/I64 = new('icons/64x64.dmi')
            master_64.Blend(I64)

    var/end64 = world.tick_usage
    duration_64 = end64 - start64
    info("Done 64x64")

    sleep(world.tick_lag) // Let the tick calm down
    info("Running 128x128")
    var/start128 = world.tick_usage // Should be 0
    for(var/i in 1 to 1000)
        var/icon/master_128 = new('icons/128x128.dmi')
        for(var/j in 1 to 100)
            var/icon/I128 = new('icons/128x128.dmi')
            master_128.Blend(I128)

    var/end128 = world.tick_usage
    duration_128 = end128 - start128
    info("Done 128x128")

    sleep(world.tick_lag) // Let the tick calm down
    info("Running 256x256")
    var/start256 = world.tick_usage // Should be 0
    for(var/i in 1 to 1000)
        var/icon/master_256 = new('icons/256x256.dmi')
        for(var/j in 1 to 100)
            var/icon/I256 = new('icons/256x256.dmi')
            master_256.Blend(I256)

    var/end256 = world.tick_usage
    duration_256 = end256 - start256
    info("Done 256x256")


/datum/benchmark/imageblend/report_result()
    info("32x32 Time: [duration_32]ms")
    info("64x64 Time: [duration_64]ms")
    info("128x128 Time: [duration_128]ms")
    info("256x256 Time: [duration_256]ms")
