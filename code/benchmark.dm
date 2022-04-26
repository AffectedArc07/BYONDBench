/datum/benchmark
    var/name = "unset"
    var/only_this_one = FALSE

/datum/benchmark/proc/run_benchmark()
    CRASH("run() not implemented for [type]")

/datum/benchmark/proc/report_result()
    CRASH("run() not implemented for [type]")

/datum/benchmark/proc/info(text)
    world.log << "\[[name]] [text]"
