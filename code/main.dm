/world
    loop_checks = FALSE
    fps = 10 // DO NOT CHANGE

/world/New()
    // Setup all benchmarks
    var/list/datum/benchmark/benchmarks = list()

    var/only_run_one = FALSE
    var/datum/benchmark/only
    for(var/benchmark_type in subtypesof(/datum/benchmark))
        var/datum/benchmark/bm = new benchmark_type()
        if(bm.only_this_one)
            only_run_one = TRUE
            only = bm
            break
        benchmarks.Add(bm)


    info("Starting up on [byond_version].[byond_build]")
    info("Cleaning work dir...")
    cleanup()
    info("Done")

    if(only_run_one)
        benchmarks.Cut()
        benchmarks.Add(only)
        info("ONLY RUNNING [only.name]")

    info("Loaded [length(benchmarks)] benchmarks")

    for(var/datum/benchmark/benchmark in benchmarks)
        info("Now running: [benchmark.name]")
        benchmark.run_benchmark()
        // Give it some time
        sleep(world.tick_lag)

    // Report all results in 1 go
    info("\[=====] RESULTS \[=====]")
    for(var/datum/benchmark/benchmark in benchmarks)
        benchmark.report_result()

    info("Done!")
    // This helps BYOND do a clean shutdown
    eval("")

/world/proc/info(text)
    world.log << "\[Main] [text]"
