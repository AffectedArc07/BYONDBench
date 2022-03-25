/datum/benchmark/listset
    name = "ListSet"

    // Duration holder
    var/duration = 0

// Creates a list with a length of 32765, and sets each index to its ID squared. Repeated 1000 times for averaging purposes.
/datum/benchmark/listset/run_benchmark()
    info("Running")
    var/start = world.tick_usage // Should be 0
    for(var/i in 1 to 1000)
        var/list/benching_list = list()
        benching_list.len = 32765
        for(var/j in 1 to 32765)
            benching_list[j] = j ** 2
    var/end = world.tick_usage
    duration = end - start
    info("Done")

/datum/benchmark/listset/report_result()
    info("Time: [duration]ms")
