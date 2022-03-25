# BYONDBench

A system benchmark designed to test how well your system performs common operations in BYOND. The following operations are supported:

- `ImageBlend` - Blends 100 icons over eachother, 1000 times. This will test your disk and CPU. Tests 32x32, 64x64, 128x128, 256x256
- `ListSet` - Creates a list with a length of 32765, and sets each index to its ID squared. Repeated 1000 times for averaging purposes.
- `MapExpand` - Expands a z-level to to 1000x1000, then adds 50 of them.

## Building

1. Open up `byondbench.dme`
2. Click the `Build` dropdown and press `Compile`.

## Running

1. Open up Dream Daemon and select the `byondbench.dmb` file.
2. Press go and **DO NOT** touch DreamDaemon. It will automatically exit once it is done.

## Contributing

Just follow sane code practices like you would from any SS13 branch. Files should be CRLF.

## License

This software is licensed under AGPL-3. Why? Because that means we can use SS13 code fragments easily for benchmark routines.
