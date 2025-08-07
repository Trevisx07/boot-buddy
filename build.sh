set -e
nasm -f bin boot.asm -o boot.bin
gcc -ffreestanding -m64 -c kernel.c -o kernel.o
ld -Ttext 0x100000 -o kernel.bin --oformat binary kernel.o
dd if=/dev/zero of=boot.img bs=512 count=2880
dd conv=notrunc if=boot.bin of=boot.img bs=512 count=1
dd conv=notrunc if=kernel.bin of=boot.img bs=512 seek=1
echo "✅ Build complete – boot.img ready"