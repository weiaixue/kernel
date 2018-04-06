.code16

.global _bootstart

.equ BOOTSEG, 0x07c0

# 16-real mod
.text

ljmp $BOOTSEG, $_bootstart

_bootstart:
	mov $0x03,%ah
	int $0x10

	mov $BOOTSEG,%ax
	mov %ax,%es
	mov $_string,%bp

	mov $0x1301,%ax
	mov $0x000b,%bx
	mov $0x0f,%cx
	int $0x10

loop:	jmp loop	


_string: 
	.ascii "hello world!"
	.byte 13,10,13,10
.=510

signature:
	.word 0xaa55
