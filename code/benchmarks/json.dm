/datum/benchmark/json
    name = "JSON"

    // Duration holders
    var/duration_decode = 0
    var/duration_encode = 0

/datum/benchmark/json/run_benchmark()
    info("WARNING. THIS WILL LAG DREAMDAEMON A LOT. IT MAY GO NOT RESPONDING.")
    info("THIS IS NORMAL.")
    info("BENCHMARK WILL START IN 5 SECONDS.")
    sleep(50)

    // Load the JSON
    var/json_data = file2text("./large_json.json") // Profiler data from paradise. Its a big json.
    info("Running decode")
    // Right. BYOND takes so long to do this that world.tick_usage doesnt work.
    // You have to track it on world.timeofday
    // Dont run this near midnight rollover
    var/startdecode = world.timeofday
    var/json_object = json_decode(json_data)
    var/enddecode = world.timeofday
    duration_decode = enddecode - startdecode
    info("Done Decode")

    sleep(world.tick_lag) // Let the tick calm down

    info("Running Encode")
    var/startencode = world.tick_usage // Should be 0
    pass(json_encode(json_object))
    var/endencode = world.tick_usage
    duration_encode = endencode - startencode
    info("Done Encode")

    sleep(world.tick_lag) // Let the tick calm down


/datum/benchmark/json/report_result()
    info("Decode Time: [duration_decode / 10]s")
    info("Encode Time: [duration_encode]ms")
