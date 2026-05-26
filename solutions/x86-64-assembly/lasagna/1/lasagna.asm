; Everything that comes after a semicolon (;) is a comment

EXPECTED_MINUTES_IN_OVEN equ 40
PREPARATION_TIME_PER_LAYER equ 2

section .text

; You should implement functions in the .text section

; the global directive makes a function visible to the test files
global expected_minutes_in_oven
expected_minutes_in_oven:
    mov rax, EXPECTED_MINUTES_IN_OVEN
    ret

global remaining_minutes_in_oven
remaining_minutes_in_oven:
    call expected_minutes_in_oven    ; rax = 40
    sub rax, rdi                     ; rax = 40 - actual
    ret

global preparation_time_in_minutes
preparation_time_in_minutes:
    mov rax, PREPARATION_TIME_PER_LAYER
    imul rax, rdi                    ; rax = 2 * layers
    ret

global elapsed_time_in_minutes
elapsed_time_in_minutes:
    call preparation_time_in_minutes ; rax = prep time (uses rdi)
    add rax, rsi                     ; rax = prep + oven time
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
