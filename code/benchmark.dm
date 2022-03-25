/datum/benchmark
    var/name = "unset"

/datum/benchmark/proc/run_benchmark()
    CRASH("run() not implemented for [type]")

/datum/benchmark/proc/report_result()
    CRASH("run() not implemented for [type]")

/datum/benchmark/proc/info(text)
    world.log << "\[[name]] [text]"
