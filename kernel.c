void main(void) {
    char *vid = (char *)0xB8000;
    const char *msg = "64-bit Kernel!";
    for (int i = 0; msg[i]; ++i) {
        vid[2*i]   = msg[i];
        vid[2*i+1] = 0x07;
    }
    while (1) __asm__("hlt");
}