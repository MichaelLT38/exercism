
WEIGHT_OF_EMPTY_BOX equ 500
TRUCK_HEIGHT equ 300
PAY_PER_BOX equ 5
PAY_PER_TRUCK_TRIP equ 220

section .text

global get_box_weight
get_box_weight:
    imul rdi, rsi
    imul rdx, rcx
    lea rax, [rdi + rdx + WEIGHT_OF_EMPTY_BOX]  
    ret

global max_number_of_boxes
max_number_of_boxes:
    mov rax, TRUCK_HEIGHT
    xor rdx, rdx
    div rdi
    ret

global items_to_be_moved
items_to_be_moved:
    sub edi, esi
    mov eax, edi
    ret

global calculate_payment
calculate_payment:
    imul rax, rsi, PAY_PER_BOX
    imul r10, rdx, PAY_PER_TRUCK_TRIP
    add rax, r10
    sub rax, rdi
    mov r10, rcx
    imul r10, r8
    sub rax, r10
    movzx r11, r9b
    inc r11
    cqo
    idiv r11               
    add rax, rdx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
