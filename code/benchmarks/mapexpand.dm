/datum/benchmark/mapexpand
    name = "MapExpand"

    // Duration holder
    var/duration = 0

// Expands a z-level to to 1000x1000, then adds 50 of them.
/datum/benchmark/mapexpand/run_benchmark()
    info("Running")
    var/start = world.tick_usage // Should be 0

    // FEEL THE BURN
    world.maxx = 1000
    world.maxy = 1000
    world.maxz = 50
    var/end = world.tick_usage
    duration = end - start
    info("Done")

/datum/benchmark/mapexpand/report_result()
    info("Time: [duration]ms")
