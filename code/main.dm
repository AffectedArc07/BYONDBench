/world
    loop_checks = FALSE

/world/New()
    // Setup all benchmarks
    var/list/datum/benchmark/benchmarks = list()

    for(var/benchmark_type in subtypesof(/datum/benchmark))
        benchmarks += new benchmark_type()

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
