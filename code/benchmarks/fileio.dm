/datum/benchmark/fileio
    name = "FileIO"

    // Duration holders
    var/duration_1_big = 0
    var/duration_10k_lines = 0
    var/duration_1000_files = 0

/datum/benchmark/fileio/run_benchmark()
    // Make a massive string
    var/list/tmplist = list()
    for(var/i in 1 to 10000)
        tmplist += LIPSUM

    var/big_str = tmplist.Join("\n")
    sleep(world.tick_lag) // Wait a sec

    info("Running 1 big write")
    var/start1 = world.tick_usage // Should be 0
    var/F = file("./work/1big.txt")
    F << big_str
    var/end1 = world.tick_usage
    duration_1_big = end1 - start1
    info("Done 1 big write")

    sleep(world.tick_lag) // Let the tick calm down

    info("Running 10k lines")
    var/start10k = world.tick_usage // Should be 0
    var/F2 = file("./work/1big.txt")
    for(var/i in 1 to 10000)
        F2 << "[i]\n"
    var/end10k = world.tick_usage
    duration_10k_lines = end10k - start10k
    info("Done 10k lines")

    sleep(world.tick_lag) // Let the tick calm down

    info("Running 1000 files")
    var/start1000 = world.tick_usage // Should be 0
    for(var/i in 1 to 1000)
        var/F3 = file("./work/1000f_[i].txt")
        F3 << "Now writing in file #[i]\n"

    var/end1000 = world.tick_usage
    duration_1000_files = end1000 - start1000
    info("Done 1000 files")

    sleep(world.tick_lag) // Let the tick calm down


/datum/benchmark/fileio/report_result()
    info("1 Big Write Time: [duration_1_big]ms")
    info("10k Lines Time: [duration_10k_lines]ms")
    info("1000 Files Time: [duration_1000_files]ms")
