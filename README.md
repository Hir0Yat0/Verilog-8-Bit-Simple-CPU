# Verilog-8-Bit-Simple-CPU
ComArch2023 Projects \

./compile.sh = compile \
./run.sh = run \
./start.sh = compile and run

- the alu is working now!
- ~~the accumulator / register should be working (havent tested, but it compiled, so...)~~
- the accumulators / registers are working now, tested! nice!
- have not implemented the decoder yet (but the basic ones should be fairly straightforward and simple to make?)

instructions:

- leftmost bit (7th bit) = set to write acc
- 6th - 4th = opcodes
- 3rd - 0 = immediates

opcodes:

- 0b000 = add
- 0b001 = mult
- 0b010 = and
- 0b011 = or
- 0b100 = not

