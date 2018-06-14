GAS LISTING /tmp/ccHswIXC.s 			page 1


   1              		.file	"pga.c"
   2              		.intel_syntax noprefix
   3              		.text
   4              	.Ltext0:
   5              		.globl	pga_table_create
   7              	pga_table_create:
   8              	.LFB2:
   9              		.file 1 "././table.c"
   1:././table.c   **** #include <stdio.h>
   2:././table.c   **** #include <stdlib.h>
   3:././table.c   **** 
   4:././table.c   **** typedef __uint64_t uint64;
   5:././table.c   **** typedef unsigned char byte;
   6:././table.c   **** 
   7:././table.c   **** struct pga_table
   8:././table.c   **** {
   9:././table.c   ****     uint64 ** matrix;
  10:././table.c   ****     int width;
  11:././table.c   ****     int height;
  12:././table.c   **** };
  13:././table.c   **** 
  14:././table.c   **** struct pga_table * pga_table_create(int width, int height)
  15:././table.c   **** {
  10              		.loc 1 15 0
  11              		.cfi_startproc
  12 0000 55       		push	rbp
  13              		.cfi_def_cfa_offset 16
  14              		.cfi_offset 6, -16
  15 0001 4889E5   		mov	rbp, rsp
  16              		.cfi_def_cfa_register 6
  17 0004 4883EC30 		sub	rsp, 48
  18 0008 897DDC   		mov	DWORD PTR [rbp-36], edi
  19 000b 8975D8   		mov	DWORD PTR [rbp-40], esi
  16:././table.c   ****     struct pga_table * table = malloc(1 * sizeof(struct pga_table));
  20              		.loc 1 16 0
  21 000e BF100000 		mov	edi, 16
  21      00
  22 0013 E8000000 		call	malloc
  22      00
  23 0018 488945F0 		mov	QWORD PTR [rbp-16], rax
  17:././table.c   **** 
  18:././table.c   ****     table->width = width;
  24              		.loc 1 18 0
  25 001c 488B45F0 		mov	rax, QWORD PTR [rbp-16]
  26 0020 8B55DC   		mov	edx, DWORD PTR [rbp-36]
  27 0023 895008   		mov	DWORD PTR [rax+8], edx
  19:././table.c   ****     table->height = height;
  28              		.loc 1 19 0
  29 0026 488B45F0 		mov	rax, QWORD PTR [rbp-16]
  30 002a 8B55D8   		mov	edx, DWORD PTR [rbp-40]
  31 002d 89500C   		mov	DWORD PTR [rax+12], edx
  20:././table.c   **** 
  21:././table.c   ****     table->matrix = malloc(width * sizeof(uint64 *));
  32              		.loc 1 21 0
  33 0030 8B45DC   		mov	eax, DWORD PTR [rbp-36]
  34 0033 4898     		cdqe
  35 0035 48C1E003 		sal	rax, 3
GAS LISTING /tmp/ccHswIXC.s 			page 2


  36 0039 4889C7   		mov	rdi, rax
  37 003c E8000000 		call	malloc
  37      00
  38 0041 4889C2   		mov	rdx, rax
  39 0044 488B45F0 		mov	rax, QWORD PTR [rbp-16]
  40 0048 488910   		mov	QWORD PTR [rax], rdx
  22:././table.c   **** 
  23:././table.c   ****     uint64 * matrix_array = malloc(width * height * sizeof(uint64));
  41              		.loc 1 23 0
  42 004b 8B45DC   		mov	eax, DWORD PTR [rbp-36]
  43 004e 0FAF45D8 		imul	eax, DWORD PTR [rbp-40]
  44 0052 4898     		cdqe
  45 0054 48C1E003 		sal	rax, 3
  46 0058 4889C7   		mov	rdi, rax
  47 005b E8000000 		call	malloc
  47      00
  48 0060 488945F8 		mov	QWORD PTR [rbp-8], rax
  49              	.LBB2:
  24:././table.c   **** 
  25:././table.c   ****     for (int x = 0; x < width; x++)
  50              		.loc 1 25 0
  51 0064 C745EC00 		mov	DWORD PTR [rbp-20], 0
  51      000000
  52 006b EB33     		jmp	.L2
  53              	.L3:
  26:././table.c   ****     {
  27:././table.c   ****         table->matrix[x] = &matrix_array[x * height];
  54              		.loc 1 27 0 discriminator 3
  55 006d 488B45F0 		mov	rax, QWORD PTR [rbp-16]
  56 0071 488B00   		mov	rax, QWORD PTR [rax]
  57 0074 8B55EC   		mov	edx, DWORD PTR [rbp-20]
  58 0077 4863D2   		movsx	rdx, edx
  59 007a 48C1E203 		sal	rdx, 3
  60 007e 4801C2   		add	rdx, rax
  61 0081 8B45EC   		mov	eax, DWORD PTR [rbp-20]
  62 0084 0FAF45D8 		imul	eax, DWORD PTR [rbp-40]
  63 0088 4898     		cdqe
  64 008a 488D0CC5 		lea	rcx, [0+rax*8]
  64      00000000 
  65 0092 488B45F8 		mov	rax, QWORD PTR [rbp-8]
  66 0096 4801C8   		add	rax, rcx
  67 0099 488902   		mov	QWORD PTR [rdx], rax
  25:././table.c   ****     {
  68              		.loc 1 25 0 discriminator 3
  69 009c 8345EC01 		add	DWORD PTR [rbp-20], 1
  70              	.L2:
  25:././table.c   ****     {
  71              		.loc 1 25 0 is_stmt 0 discriminator 1
  72 00a0 8B45EC   		mov	eax, DWORD PTR [rbp-20]
  73 00a3 3B45DC   		cmp	eax, DWORD PTR [rbp-36]
  74 00a6 7CC5     		jl	.L3
  75              	.LBE2:
  28:././table.c   ****     }
  29:././table.c   **** 
  30:././table.c   ****     return table;
  76              		.loc 1 30 0 is_stmt 1
  77 00a8 488B45F0 		mov	rax, QWORD PTR [rbp-16]
GAS LISTING /tmp/ccHswIXC.s 			page 3


  31:././table.c   **** }...
  78              		.loc 1 31 0
  79 00ac C9       		leave
  80              		.cfi_def_cfa 7, 8
  81 00ad C3       		ret
  82              		.cfi_endproc
  83              	.LFE2:
  85              		.globl	pga_emulator_create
  87              	pga_emulator_create:
  88              	.LFB3:
  89              		.file 2 "./emulator.c"
   1:./emulator.c  **** #include <stdio.h>
   2:./emulator.c  **** #include <stdlib.h>
   3:./emulator.c  **** #include "./table.c"
   4:./emulator.c  **** 
   5:./emulator.c  **** typedef __uint64_t uint64;
   6:./emulator.c  **** typedef unsigned char byte;
   7:./emulator.c  **** 
   8:./emulator.c  **** #define NODE_UP 0
   9:./emulator.c  **** #define NODE_RIGHT 1
  10:./emulator.c  **** #define NODE_BOTTOM 2
  11:./emulator.c  **** #define NODE_LEFT 3
  12:./emulator.c  **** 
  13:./emulator.c  **** struct pga_emulator
  14:./emulator.c  **** {
  15:./emulator.c  ****     struct pga_table * table;
  16:./emulator.c  **** 
  17:./emulator.c  ****     byte ** states;
  18:./emulator.c  ****     int width;
  19:./emulator.c  ****     int height;
  20:./emulator.c  **** 
  21:./emulator.c  ****     int * stack;
  22:./emulator.c  ****     int stack_pointer;
  23:./emulator.c  **** };
  24:./emulator.c  **** 
  25:./emulator.c  **** struct pga_emulator * pga_emulator_create(struct pga_table * table)
  26:./emulator.c  **** {
  90              		.loc 2 26 0
  91              		.cfi_startproc
  92 00ae 55       		push	rbp
  93              		.cfi_def_cfa_offset 16
  94              		.cfi_offset 6, -16
  95 00af 4889E5   		mov	rbp, rsp
  96              		.cfi_def_cfa_register 6
  97 00b2 4883EC40 		sub	rsp, 64
  98 00b6 48897DC8 		mov	QWORD PTR [rbp-56], rdi
  27:./emulator.c  ****     struct pga_emulator * emulator = malloc(sizeof(struct pga_emulator));
  99              		.loc 2 27 0
 100 00ba BF280000 		mov	edi, 40
 100      00
 101 00bf E8000000 		call	malloc
 101      00
 102 00c4 488945E8 		mov	QWORD PTR [rbp-24], rax
  28:./emulator.c  **** 
  29:./emulator.c  ****     int width = table->width + 2;
 103              		.loc 2 29 0
 104 00c8 488B45C8 		mov	rax, QWORD PTR [rbp-56]
GAS LISTING /tmp/ccHswIXC.s 			page 4


 105 00cc 8B4008   		mov	eax, DWORD PTR [rax+8]
 106 00cf 83C002   		add	eax, 2
 107 00d2 8945E0   		mov	DWORD PTR [rbp-32], eax
  30:./emulator.c  ****     int height = table->height + 2;
 108              		.loc 2 30 0
 109 00d5 488B45C8 		mov	rax, QWORD PTR [rbp-56]
 110 00d9 8B400C   		mov	eax, DWORD PTR [rax+12]
 111 00dc 83C002   		add	eax, 2
 112 00df 8945E4   		mov	DWORD PTR [rbp-28], eax
  31:./emulator.c  **** 
  32:./emulator.c  ****     emulator->table = table;
 113              		.loc 2 32 0
 114 00e2 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 115 00e6 488B55C8 		mov	rdx, QWORD PTR [rbp-56]
 116 00ea 488910   		mov	QWORD PTR [rax], rdx
  33:./emulator.c  **** 
  34:./emulator.c  ****     emulator->width = width;
 117              		.loc 2 34 0
 118 00ed 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 119 00f1 8B55E0   		mov	edx, DWORD PTR [rbp-32]
 120 00f4 895010   		mov	DWORD PTR [rax+16], edx
  35:./emulator.c  ****     emulator->height = height;
 121              		.loc 2 35 0
 122 00f7 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 123 00fb 8B55E4   		mov	edx, DWORD PTR [rbp-28]
 124 00fe 895014   		mov	DWORD PTR [rax+20], edx
  36:./emulator.c  **** 
  37:./emulator.c  ****     emulator->states = malloc(width * sizeof(byte *));
 125              		.loc 2 37 0
 126 0101 8B45E0   		mov	eax, DWORD PTR [rbp-32]
 127 0104 4898     		cdqe
 128 0106 48C1E003 		sal	rax, 3
 129 010a 4889C7   		mov	rdi, rax
 130 010d E8000000 		call	malloc
 130      00
 131 0112 4889C2   		mov	rdx, rax
 132 0115 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 133 0119 48895008 		mov	QWORD PTR [rax+8], rdx
  38:./emulator.c  **** 
  39:./emulator.c  ****     byte * states_array = malloc(width * height * sizeof(byte));
 134              		.loc 2 39 0
 135 011d 8B45E0   		mov	eax, DWORD PTR [rbp-32]
 136 0120 0FAF45E4 		imul	eax, DWORD PTR [rbp-28]
 137 0124 4898     		cdqe
 138 0126 4889C7   		mov	rdi, rax
 139 0129 E8000000 		call	malloc
 139      00
 140 012e 488945F0 		mov	QWORD PTR [rbp-16], rax
 141              	.LBB3:
  40:./emulator.c  **** 
  41:./emulator.c  ****     for (int i = 0; i < width * height; i++)
 142              		.loc 2 41 0
 143 0132 C745D800 		mov	DWORD PTR [rbp-40], 0
 143      000000
 144 0139 EB14     		jmp	.L6
 145              	.L7:
  42:./emulator.c  ****     {
GAS LISTING /tmp/ccHswIXC.s 			page 5


  43:./emulator.c  ****         states_array[i] = 255;
 146              		.loc 2 43 0 discriminator 3
 147 013b 8B45D8   		mov	eax, DWORD PTR [rbp-40]
 148 013e 4863D0   		movsx	rdx, eax
 149 0141 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 150 0145 4801D0   		add	rax, rdx
 151 0148 C600FF   		mov	BYTE PTR [rax], -1
  41:./emulator.c  ****     {
 152              		.loc 2 41 0 discriminator 3
 153 014b 8345D801 		add	DWORD PTR [rbp-40], 1
 154              	.L6:
  41:./emulator.c  ****     {
 155              		.loc 2 41 0 is_stmt 0 discriminator 1
 156 014f 8B45E0   		mov	eax, DWORD PTR [rbp-32]
 157 0152 0FAF45E4 		imul	eax, DWORD PTR [rbp-28]
 158 0156 3B45D8   		cmp	eax, DWORD PTR [rbp-40]
 159 0159 7FE0     		jg	.L7
 160              	.LBE3:
 161              	.LBB4:
  44:./emulator.c  ****     }
  45:./emulator.c  **** 
  46:./emulator.c  ****     for (int x = 0; x < width; x++)
 162              		.loc 2 46 0 is_stmt 1
 163 015b C745DC00 		mov	DWORD PTR [rbp-36], 0
 163      000000
 164 0162 EB2D     		jmp	.L8
 165              	.L9:
  47:./emulator.c  ****     {
  48:./emulator.c  ****         emulator->states[x] = &states_array[x * height];
 166              		.loc 2 48 0 discriminator 3
 167 0164 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 168 0168 488B4008 		mov	rax, QWORD PTR [rax+8]
 169 016c 8B55DC   		mov	edx, DWORD PTR [rbp-36]
 170 016f 4863D2   		movsx	rdx, edx
 171 0172 48C1E203 		sal	rdx, 3
 172 0176 4801C2   		add	rdx, rax
 173 0179 8B45DC   		mov	eax, DWORD PTR [rbp-36]
 174 017c 0FAF45E4 		imul	eax, DWORD PTR [rbp-28]
 175 0180 4863C8   		movsx	rcx, eax
 176 0183 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 177 0187 4801C8   		add	rax, rcx
 178 018a 488902   		mov	QWORD PTR [rdx], rax
  46:./emulator.c  ****     {
 179              		.loc 2 46 0 discriminator 3
 180 018d 8345DC01 		add	DWORD PTR [rbp-36], 1
 181              	.L8:
  46:./emulator.c  ****     {
 182              		.loc 2 46 0 is_stmt 0 discriminator 1
 183 0191 8B45DC   		mov	eax, DWORD PTR [rbp-36]
 184 0194 3B45E0   		cmp	eax, DWORD PTR [rbp-32]
 185 0197 7CCB     		jl	.L9
 186              	.LBE4:
  49:./emulator.c  ****     }
  50:./emulator.c  **** 
  51:./emulator.c  ****     emulator->stack_pointer = 0;
 187              		.loc 2 51 0 is_stmt 1
 188 0199 488B45E8 		mov	rax, QWORD PTR [rbp-24]
GAS LISTING /tmp/ccHswIXC.s 			page 6


 189 019d C7402000 		mov	DWORD PTR [rax+32], 0
 189      000000
  52:./emulator.c  **** 
  53:./emulator.c  ****     int * stack = malloc(1024 * sizeof(int));
 190              		.loc 2 53 0
 191 01a4 BF001000 		mov	edi, 4096
 191      00
 192 01a9 E8000000 		call	malloc
 192      00
 193 01ae 488945F8 		mov	QWORD PTR [rbp-8], rax
  54:./emulator.c  **** 
  55:./emulator.c  ****     emulator->stack = stack;
 194              		.loc 2 55 0
 195 01b2 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 196 01b6 488B55F8 		mov	rdx, QWORD PTR [rbp-8]
 197 01ba 48895018 		mov	QWORD PTR [rax+24], rdx
  56:./emulator.c  **** 
  57:./emulator.c  ****     return emulator;
 198              		.loc 2 57 0
 199 01be 488B45E8 		mov	rax, QWORD PTR [rbp-24]
  58:./emulator.c  **** }
 200              		.loc 2 58 0
 201 01c2 C9       		leave
 202              		.cfi_def_cfa 7, 8
 203 01c3 C3       		ret
 204              		.cfi_endproc
 205              	.LFE3:
 207              		.globl	pga_emulator_render
 209              	pga_emulator_render:
 210              	.LFB4:
  59:./emulator.c  **** 
  60:./emulator.c  **** int pga_emulator_render(struct pga_emulator * emulator)
  61:./emulator.c  **** {
 211              		.loc 2 61 0
 212              		.cfi_startproc
 213 01c4 55       		push	rbp
 214              		.cfi_def_cfa_offset 16
 215              		.cfi_offset 6, -16
 216 01c5 4889E5   		mov	rbp, rsp
 217              		.cfi_def_cfa_register 6
 218 01c8 48897DA8 		mov	QWORD PTR [rbp-88], rdi
  62:./emulator.c  ****     int iterations = 0;
 219              		.loc 2 62 0
 220 01cc C745C000 		mov	DWORD PTR [rbp-64], 0
 220      000000
  63:./emulator.c  **** 
  64:./emulator.c  ****     int x, y;
  65:./emulator.c  **** 
  66:./emulator.c  ****     uint64 ** matrix = emulator->table->matrix;
 221              		.loc 2 66 0
 222 01d3 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 223 01d7 488B00   		mov	rax, QWORD PTR [rax]
 224 01da 488B00   		mov	rax, QWORD PTR [rax]
 225 01dd 488945D8 		mov	QWORD PTR [rbp-40], rax
  67:./emulator.c  **** 
  68:./emulator.c  ****     int * stack = emulator->stack;
 226              		.loc 2 68 0
GAS LISTING /tmp/ccHswIXC.s 			page 7


 227 01e1 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 228 01e5 488B4018 		mov	rax, QWORD PTR [rax+24]
 229 01e9 488945E0 		mov	QWORD PTR [rbp-32], rax
  69:./emulator.c  ****     int sp = emulator->stack_pointer;
 230              		.loc 2 69 0
 231 01ed 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 232 01f1 8B4020   		mov	eax, DWORD PTR [rax+32]
 233 01f4 8945C4   		mov	DWORD PTR [rbp-60], eax
  70:./emulator.c  **** 
  71:./emulator.c  ****     byte ** states = emulator->states;
 234              		.loc 2 71 0
 235 01f7 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 236 01fb 488B4008 		mov	rax, QWORD PTR [rax+8]
 237 01ff 488945E8 		mov	QWORD PTR [rbp-24], rax
  72:./emulator.c  **** 
  73:./emulator.c  ****     int width = emulator->table->width;
 238              		.loc 2 73 0
 239 0203 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 240 0207 488B00   		mov	rax, QWORD PTR [rax]
 241 020a 8B4008   		mov	eax, DWORD PTR [rax+8]
 242 020d 8945C8   		mov	DWORD PTR [rbp-56], eax
  74:./emulator.c  ****     int height = emulator->table->height;
 243              		.loc 2 74 0
 244 0210 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 245 0214 488B00   		mov	rax, QWORD PTR [rax]
 246 0217 8B400C   		mov	eax, DWORD PTR [rax+12]
 247 021a 8945CC   		mov	DWORD PTR [rbp-52], eax
  75:./emulator.c  **** 
  76:./emulator.c  ****     uint64 lut;
  77:./emulator.c  **** 
  78:./emulator.c  ****     byte inputs, state_new;
  79:./emulator.c  ****     byte * state_current;
  80:./emulator.c  **** 
  81:./emulator.c  ****     while (sp > 0)
 248              		.loc 2 81 0
 249 021d E9C70200 		jmp	.L12
 249      00
 250              	.L16:
  82:./emulator.c  ****     {
  83:./emulator.c  ****         y = stack[--sp];
 251              		.loc 2 83 0
 252 0222 836DC401 		sub	DWORD PTR [rbp-60], 1
 253 0226 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 254 0229 4898     		cdqe
 255 022b 488D1485 		lea	rdx, [0+rax*4]
 255      00000000 
 256 0233 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 257 0237 4801D0   		add	rax, rdx
 258 023a 8B00     		mov	eax, DWORD PTR [rax]
 259 023c 8945D0   		mov	DWORD PTR [rbp-48], eax
  84:./emulator.c  ****         x = stack[--sp];
 260              		.loc 2 84 0
 261 023f 836DC401 		sub	DWORD PTR [rbp-60], 1
 262 0243 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 263 0246 4898     		cdqe
 264 0248 488D1485 		lea	rdx, [0+rax*4]
 264      00000000 
GAS LISTING /tmp/ccHswIXC.s 			page 8


 265 0250 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 266 0254 4801D0   		add	rax, rdx
 267 0257 8B00     		mov	eax, DWORD PTR [rax]
 268 0259 8945D4   		mov	DWORD PTR [rbp-44], eax
  85:./emulator.c  **** 
  86:./emulator.c  ****         if (x < 0 || y < 0 || x >= width || y >= height)
 269              		.loc 2 86 0
 270 025c 837DD400 		cmp	DWORD PTR [rbp-44], 0
 271 0260 0F888302 		js	.L12
 271      0000
 272              		.loc 2 86 0 is_stmt 0 discriminator 1
 273 0266 837DD000 		cmp	DWORD PTR [rbp-48], 0
 274 026a 0F887902 		js	.L12
 274      0000
 275              		.loc 2 86 0 discriminator 2
 276 0270 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 277 0273 3B45C8   		cmp	eax, DWORD PTR [rbp-56]
 278 0276 0F8D6D02 		jge	.L12
 278      0000
 279              		.loc 2 86 0 discriminator 3
 280 027c 8B45D0   		mov	eax, DWORD PTR [rbp-48]
 281 027f 3B45CC   		cmp	eax, DWORD PTR [rbp-52]
 282 0282 7C05     		jl	.L14
  87:./emulator.c  ****         {
  88:./emulator.c  ****             continue;
 283              		.loc 2 88 0 is_stmt 1
 284 0284 E9600200 		jmp	.L12
 284      00
 285              	.L14:
  89:./emulator.c  ****         }
  90:./emulator.c  **** 
  91:./emulator.c  ****         lut = matrix[x][y];
 286              		.loc 2 91 0
 287 0289 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 288 028c 4898     		cdqe
 289 028e 488D14C5 		lea	rdx, [0+rax*8]
 289      00000000 
 290 0296 488B45D8 		mov	rax, QWORD PTR [rbp-40]
 291 029a 4801D0   		add	rax, rdx
 292 029d 488B00   		mov	rax, QWORD PTR [rax]
 293 02a0 8B55D0   		mov	edx, DWORD PTR [rbp-48]
 294 02a3 4863D2   		movsx	rdx, edx
 295 02a6 48C1E203 		sal	rdx, 3
 296 02aa 4801D0   		add	rax, rdx
 297 02ad 488B00   		mov	rax, QWORD PTR [rax]
 298 02b0 488945F0 		mov	QWORD PTR [rbp-16], rax
  92:./emulator.c  **** 
  93:./emulator.c  ****         x++;
 299              		.loc 2 93 0
 300 02b4 8345D401 		add	DWORD PTR [rbp-44], 1
  94:./emulator.c  ****         y++;
 301              		.loc 2 94 0
 302 02b8 8345D001 		add	DWORD PTR [rbp-48], 1
  95:./emulator.c  **** 
  96:./emulator.c  ****         state_current = &states[x][y];
 303              		.loc 2 96 0
 304 02bc 8B45D4   		mov	eax, DWORD PTR [rbp-44]
GAS LISTING /tmp/ccHswIXC.s 			page 9


 305 02bf 4898     		cdqe
 306 02c1 488D14C5 		lea	rdx, [0+rax*8]
 306      00000000 
 307 02c9 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 308 02cd 4801D0   		add	rax, rdx
 309 02d0 488B10   		mov	rdx, QWORD PTR [rax]
 310 02d3 8B45D0   		mov	eax, DWORD PTR [rbp-48]
 311 02d6 4898     		cdqe
 312 02d8 4801D0   		add	rax, rdx
 313 02db 488945F8 		mov	QWORD PTR [rbp-8], rax
  97:./emulator.c  **** 
  98:./emulator.c  ****         inputs = (
  99:./emulator.c  ****             0b0
 100:./emulator.c  ****             | (((states[x][y - 1] >> NODE_BOTTOM) & 0b1) << NODE_UP)
 314              		.loc 2 100 0
 315 02df 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 316 02e2 4898     		cdqe
 317 02e4 488D14C5 		lea	rdx, [0+rax*8]
 317      00000000 
 318 02ec 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 319 02f0 4801D0   		add	rax, rdx
 320 02f3 488B00   		mov	rax, QWORD PTR [rax]
 321 02f6 8B55D0   		mov	edx, DWORD PTR [rbp-48]
 322 02f9 4863D2   		movsx	rdx, edx
 323 02fc 4883EA01 		sub	rdx, 1
 324 0300 4801D0   		add	rax, rdx
 325 0303 0FB600   		movzx	eax, BYTE PTR [rax]
  98:./emulator.c  ****             0b0
 326              		.loc 2 98 0
 327 0306 C0E802   		shr	al, 2
 328 0309 83E001   		and	eax, 1
 329 030c 89C1     		mov	ecx, eax
 101:./emulator.c  ****             | (((states[x + 1][y] >> NODE_LEFT) & 0b1) << NODE_RIGHT)
 330              		.loc 2 101 0
 331 030e 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 332 0311 4898     		cdqe
 333 0313 4883C001 		add	rax, 1
 334 0317 488D14C5 		lea	rdx, [0+rax*8]
 334      00000000 
 335 031f 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 336 0323 4801D0   		add	rax, rdx
 337 0326 488B10   		mov	rdx, QWORD PTR [rax]
 338 0329 8B45D0   		mov	eax, DWORD PTR [rbp-48]
 339 032c 4898     		cdqe
 340 032e 4801D0   		add	rax, rdx
 341 0331 0FB600   		movzx	eax, BYTE PTR [rax]
 342 0334 C0E803   		shr	al, 3
 343 0337 0FB6C0   		movzx	eax, al
 344 033a 83E001   		and	eax, 1
 345 033d 01C0     		add	eax, eax
  98:./emulator.c  ****             0b0
 346              		.loc 2 98 0
 347 033f 09C1     		or	ecx, eax
 102:./emulator.c  ****             | (((states[x][y + 1] >> NODE_UP) & 0b1) << NODE_BOTTOM)
 348              		.loc 2 102 0
 349 0341 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 350 0344 4898     		cdqe
GAS LISTING /tmp/ccHswIXC.s 			page 10


 351 0346 488D14C5 		lea	rdx, [0+rax*8]
 351      00000000 
 352 034e 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 353 0352 4801D0   		add	rax, rdx
 354 0355 488B00   		mov	rax, QWORD PTR [rax]
 355 0358 8B55D0   		mov	edx, DWORD PTR [rbp-48]
 356 035b 4863D2   		movsx	rdx, edx
 357 035e 4883C201 		add	rdx, 1
 358 0362 4801D0   		add	rax, rdx
 359 0365 0FB600   		movzx	eax, BYTE PTR [rax]
 360 0368 0FB6C0   		movzx	eax, al
 361 036b 83E001   		and	eax, 1
 362 036e C1E002   		sal	eax, 2
  98:./emulator.c  ****             0b0
 363              		.loc 2 98 0
 364 0371 09C1     		or	ecx, eax
 103:./emulator.c  ****             | (((states[x - 1][y] >> NODE_RIGHT) & 0b1) << NODE_LEFT)
 365              		.loc 2 103 0
 366 0373 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 367 0376 4898     		cdqe
 368 0378 48C1E003 		sal	rax, 3
 369 037c 488D50F8 		lea	rdx, [rax-8]
 370 0380 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 371 0384 4801D0   		add	rax, rdx
 372 0387 488B10   		mov	rdx, QWORD PTR [rax]
 373 038a 8B45D0   		mov	eax, DWORD PTR [rbp-48]
 374 038d 4898     		cdqe
 375 038f 4801D0   		add	rax, rdx
 376 0392 0FB600   		movzx	eax, BYTE PTR [rax]
 377 0395 D0E8     		shr	al
 378 0397 0FB6C0   		movzx	eax, al
 379 039a 83E001   		and	eax, 1
 380 039d C1E003   		sal	eax, 3
  98:./emulator.c  ****             0b0
 381              		.loc 2 98 0
 382 03a0 09C8     		or	eax, ecx
 383 03a2 8845BE   		mov	BYTE PTR [rbp-66], al
 104:./emulator.c  ****         );
 105:./emulator.c  **** 
 106:./emulator.c  ****         state_new = (lut >> (inputs << 2)) & 0b1111;
 384              		.loc 2 106 0
 385 03a5 0FB645BE 		movzx	eax, BYTE PTR [rbp-66]
 386 03a9 C1E002   		sal	eax, 2
 387 03ac 488B55F0 		mov	rdx, QWORD PTR [rbp-16]
 388 03b0 89C1     		mov	ecx, eax
 389 03b2 48D3EA   		shr	rdx, cl
 390 03b5 4889D0   		mov	rax, rdx
 391 03b8 83E00F   		and	eax, 15
 392 03bb 8845BF   		mov	BYTE PTR [rbp-65], al
 107:./emulator.c  **** 
 108:./emulator.c  ****         if (*state_current == state_new)
 393              		.loc 2 108 0
 394 03be 488B45F8 		mov	rax, QWORD PTR [rbp-8]
 395 03c2 0FB600   		movzx	eax, BYTE PTR [rax]
 396 03c5 3A45BF   		cmp	al, BYTE PTR [rbp-65]
 397 03c8 7505     		jne	.L15
 109:./emulator.c  ****         {
GAS LISTING /tmp/ccHswIXC.s 			page 11


 110:./emulator.c  ****             continue;
 398              		.loc 2 110 0
 399 03ca E91A0100 		jmp	.L12
 399      00
 400              	.L15:
 111:./emulator.c  ****         }
 112:./emulator.c  **** 
 113:./emulator.c  ****         *state_current = state_new;
 401              		.loc 2 113 0
 402 03cf 488B45F8 		mov	rax, QWORD PTR [rbp-8]
 403 03d3 0FB655BF 		movzx	edx, BYTE PTR [rbp-65]
 404 03d7 8810     		mov	BYTE PTR [rax], dl
 114:./emulator.c  **** 
 115:./emulator.c  ****         x--;
 405              		.loc 2 115 0
 406 03d9 836DD401 		sub	DWORD PTR [rbp-44], 1
 116:./emulator.c  ****         y--;
 407              		.loc 2 116 0
 408 03dd 836DD001 		sub	DWORD PTR [rbp-48], 1
 117:./emulator.c  **** 
 118:./emulator.c  ****         iterations++;
 409              		.loc 2 118 0
 410 03e1 8345C001 		add	DWORD PTR [rbp-64], 1
 119:./emulator.c  **** 
 120:./emulator.c  ****         stack[sp++] = x;
 411              		.loc 2 120 0
 412 03e5 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 413 03e8 8D5001   		lea	edx, [rax+1]
 414 03eb 8955C4   		mov	DWORD PTR [rbp-60], edx
 415 03ee 4898     		cdqe
 416 03f0 488D1485 		lea	rdx, [0+rax*4]
 416      00000000 
 417 03f8 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 418 03fc 4801C2   		add	rdx, rax
 419 03ff 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 420 0402 8902     		mov	DWORD PTR [rdx], eax
 121:./emulator.c  ****         stack[sp++] = y - 1;
 421              		.loc 2 121 0
 422 0404 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 423 0407 8D5001   		lea	edx, [rax+1]
 424 040a 8955C4   		mov	DWORD PTR [rbp-60], edx
 425 040d 4898     		cdqe
 426 040f 488D1485 		lea	rdx, [0+rax*4]
 426      00000000 
 427 0417 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 428 041b 4801D0   		add	rax, rdx
 429 041e 8B55D0   		mov	edx, DWORD PTR [rbp-48]
 430 0421 83EA01   		sub	edx, 1
 431 0424 8910     		mov	DWORD PTR [rax], edx
 122:./emulator.c  **** 
 123:./emulator.c  ****         stack[sp++] = x + 1;
 432              		.loc 2 123 0
 433 0426 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 434 0429 8D5001   		lea	edx, [rax+1]
 435 042c 8955C4   		mov	DWORD PTR [rbp-60], edx
 436 042f 4898     		cdqe
 437 0431 488D1485 		lea	rdx, [0+rax*4]
GAS LISTING /tmp/ccHswIXC.s 			page 12


 437      00000000 
 438 0439 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 439 043d 4801D0   		add	rax, rdx
 440 0440 8B55D4   		mov	edx, DWORD PTR [rbp-44]
 441 0443 83C201   		add	edx, 1
 442 0446 8910     		mov	DWORD PTR [rax], edx
 124:./emulator.c  ****         stack[sp++] = y;
 443              		.loc 2 124 0
 444 0448 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 445 044b 8D5001   		lea	edx, [rax+1]
 446 044e 8955C4   		mov	DWORD PTR [rbp-60], edx
 447 0451 4898     		cdqe
 448 0453 488D1485 		lea	rdx, [0+rax*4]
 448      00000000 
 449 045b 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 450 045f 4801C2   		add	rdx, rax
 451 0462 8B45D0   		mov	eax, DWORD PTR [rbp-48]
 452 0465 8902     		mov	DWORD PTR [rdx], eax
 125:./emulator.c  **** 
 126:./emulator.c  ****         stack[sp++] = x;
 453              		.loc 2 126 0
 454 0467 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 455 046a 8D5001   		lea	edx, [rax+1]
 456 046d 8955C4   		mov	DWORD PTR [rbp-60], edx
 457 0470 4898     		cdqe
 458 0472 488D1485 		lea	rdx, [0+rax*4]
 458      00000000 
 459 047a 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 460 047e 4801C2   		add	rdx, rax
 461 0481 8B45D4   		mov	eax, DWORD PTR [rbp-44]
 462 0484 8902     		mov	DWORD PTR [rdx], eax
 127:./emulator.c  ****         stack[sp++] = y + 1;
 463              		.loc 2 127 0
 464 0486 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 465 0489 8D5001   		lea	edx, [rax+1]
 466 048c 8955C4   		mov	DWORD PTR [rbp-60], edx
 467 048f 4898     		cdqe
 468 0491 488D1485 		lea	rdx, [0+rax*4]
 468      00000000 
 469 0499 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 470 049d 4801D0   		add	rax, rdx
 471 04a0 8B55D0   		mov	edx, DWORD PTR [rbp-48]
 472 04a3 83C201   		add	edx, 1
 473 04a6 8910     		mov	DWORD PTR [rax], edx
 128:./emulator.c  **** 
 129:./emulator.c  ****         stack[sp++] = x - 1;
 474              		.loc 2 129 0
 475 04a8 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 476 04ab 8D5001   		lea	edx, [rax+1]
 477 04ae 8955C4   		mov	DWORD PTR [rbp-60], edx
 478 04b1 4898     		cdqe
 479 04b3 488D1485 		lea	rdx, [0+rax*4]
 479      00000000 
 480 04bb 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 481 04bf 4801D0   		add	rax, rdx
 482 04c2 8B55D4   		mov	edx, DWORD PTR [rbp-44]
 483 04c5 83EA01   		sub	edx, 1
GAS LISTING /tmp/ccHswIXC.s 			page 13


 484 04c8 8910     		mov	DWORD PTR [rax], edx
 130:./emulator.c  ****         stack[sp++] = y;
 485              		.loc 2 130 0
 486 04ca 8B45C4   		mov	eax, DWORD PTR [rbp-60]
 487 04cd 8D5001   		lea	edx, [rax+1]
 488 04d0 8955C4   		mov	DWORD PTR [rbp-60], edx
 489 04d3 4898     		cdqe
 490 04d5 488D1485 		lea	rdx, [0+rax*4]
 490      00000000 
 491 04dd 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 492 04e1 4801C2   		add	rdx, rax
 493 04e4 8B45D0   		mov	eax, DWORD PTR [rbp-48]
 494 04e7 8902     		mov	DWORD PTR [rdx], eax
 495              	.L12:
  81:./emulator.c  ****     {
 496              		.loc 2 81 0
 497 04e9 837DC400 		cmp	DWORD PTR [rbp-60], 0
 498 04ed 0F8F2FFD 		jg	.L16
 498      FFFF
 131:./emulator.c  ****     }
 132:./emulator.c  **** 
 133:./emulator.c  ****     emulator->stack_pointer = sp;
 499              		.loc 2 133 0
 500 04f3 488B45A8 		mov	rax, QWORD PTR [rbp-88]
 501 04f7 8B55C4   		mov	edx, DWORD PTR [rbp-60]
 502 04fa 895020   		mov	DWORD PTR [rax+32], edx
 134:./emulator.c  **** 
 135:./emulator.c  ****     return iterations;
 503              		.loc 2 135 0
 504 04fd 8B45C0   		mov	eax, DWORD PTR [rbp-64]
 136:./emulator.c  **** }
 505              		.loc 2 136 0
 506 0500 5D       		pop	rbp
 507              		.cfi_def_cfa 7, 8
 508 0501 C3       		ret
 509              		.cfi_endproc
 510              	.LFE4:
 512              		.globl	pga_emulator_set
 514              	pga_emulator_set:
 515              	.LFB5:
 137:./emulator.c  **** 
 138:./emulator.c  **** void pga_emulator_set(struct pga_emulator * emulator, int x, int y, byte direction, byte state)
 139:./emulator.c  **** {
 516              		.loc 2 139 0
 517              		.cfi_startproc
 518 0502 55       		push	rbp
 519              		.cfi_def_cfa_offset 16
 520              		.cfi_offset 6, -16
 521 0503 4889E5   		mov	rbp, rsp
 522              		.cfi_def_cfa_register 6
 523 0506 48897DE8 		mov	QWORD PTR [rbp-24], rdi
 524 050a 8975E4   		mov	DWORD PTR [rbp-28], esi
 525 050d 8955E0   		mov	DWORD PTR [rbp-32], edx
 526 0510 89C8     		mov	eax, ecx
 527 0512 4489C2   		mov	edx, r8d
 528 0515 8845DC   		mov	BYTE PTR [rbp-36], al
 529 0518 8855D8   		mov	BYTE PTR [rbp-40], dl
GAS LISTING /tmp/ccHswIXC.s 			page 14


 140:./emulator.c  ****     int ofx = 0;
 530              		.loc 2 140 0
 531 051b C745F800 		mov	DWORD PTR [rbp-8], 0
 531      000000
 141:./emulator.c  ****     int ofy = 0;
 532              		.loc 2 141 0
 533 0522 C745FC00 		mov	DWORD PTR [rbp-4], 0
 533      000000
 142:./emulator.c  **** 
 143:./emulator.c  ****     if (NODE_UP == direction)
 534              		.loc 2 143 0
 535 0529 807DDC00 		cmp	BYTE PTR [rbp-36], 0
 536 052d 7506     		jne	.L19
 144:./emulator.c  ****     {
 145:./emulator.c  ****         ofy--;
 537              		.loc 2 145 0
 538 052f 836DFC01 		sub	DWORD PTR [rbp-4], 1
 539 0533 EB22     		jmp	.L20
 540              	.L19:
 146:./emulator.c  ****     }
 147:./emulator.c  ****     else if (NODE_RIGHT == direction)
 541              		.loc 2 147 0
 542 0535 807DDC01 		cmp	BYTE PTR [rbp-36], 1
 543 0539 7506     		jne	.L21
 148:./emulator.c  ****     {
 149:./emulator.c  ****         ofx++;
 544              		.loc 2 149 0
 545 053b 8345F801 		add	DWORD PTR [rbp-8], 1
 546 053f EB16     		jmp	.L20
 547              	.L21:
 150:./emulator.c  ****     }
 151:./emulator.c  ****     else if (NODE_BOTTOM == direction)
 548              		.loc 2 151 0
 549 0541 807DDC02 		cmp	BYTE PTR [rbp-36], 2
 550 0545 7506     		jne	.L22
 152:./emulator.c  ****     {
 153:./emulator.c  ****         ofy++;
 551              		.loc 2 153 0
 552 0547 8345FC01 		add	DWORD PTR [rbp-4], 1
 553 054b EB0A     		jmp	.L20
 554              	.L22:
 154:./emulator.c  ****     }
 155:./emulator.c  ****     else if (NODE_LEFT == direction)
 555              		.loc 2 155 0
 556 054d 807DDC03 		cmp	BYTE PTR [rbp-36], 3
 557 0551 7504     		jne	.L20
 156:./emulator.c  ****     {
 157:./emulator.c  ****         ofx--;
 558              		.loc 2 157 0
 559 0553 836DF801 		sub	DWORD PTR [rbp-8], 1
 560              	.L20:
 158:./emulator.c  ****     }
 159:./emulator.c  **** 
 160:./emulator.c  ****     emulator->stack[emulator->stack_pointer++] = x;
 561              		.loc 2 160 0
 562 0557 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 563 055b 488B7018 		mov	rsi, QWORD PTR [rax+24]
GAS LISTING /tmp/ccHswIXC.s 			page 15


 564 055f 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 565 0563 8B4020   		mov	eax, DWORD PTR [rax+32]
 566 0566 8D4801   		lea	ecx, [rax+1]
 567 0569 488B55E8 		mov	rdx, QWORD PTR [rbp-24]
 568 056d 894A20   		mov	DWORD PTR [rdx+32], ecx
 569 0570 4898     		cdqe
 570 0572 48C1E002 		sal	rax, 2
 571 0576 488D1406 		lea	rdx, [rsi+rax]
 572 057a 8B45E4   		mov	eax, DWORD PTR [rbp-28]
 573 057d 8902     		mov	DWORD PTR [rdx], eax
 161:./emulator.c  ****     emulator->stack[emulator->stack_pointer++] = y;
 574              		.loc 2 161 0
 575 057f 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 576 0583 488B7018 		mov	rsi, QWORD PTR [rax+24]
 577 0587 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 578 058b 8B4020   		mov	eax, DWORD PTR [rax+32]
 579 058e 8D4801   		lea	ecx, [rax+1]
 580 0591 488B55E8 		mov	rdx, QWORD PTR [rbp-24]
 581 0595 894A20   		mov	DWORD PTR [rdx+32], ecx
 582 0598 4898     		cdqe
 583 059a 48C1E002 		sal	rax, 2
 584 059e 488D1406 		lea	rdx, [rsi+rax]
 585 05a2 8B45E0   		mov	eax, DWORD PTR [rbp-32]
 586 05a5 8902     		mov	DWORD PTR [rdx], eax
 162:./emulator.c  **** 
 163:./emulator.c  ****     emulator->states[x + 1 + ofx][y + 1 + ofy] = 0b1 == state ? 0b1111 : 0b0000;
 587              		.loc 2 163 0
 588 05a7 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 589 05ab 488B4008 		mov	rax, QWORD PTR [rax+8]
 590 05af 8B55E4   		mov	edx, DWORD PTR [rbp-28]
 591 05b2 8D4A01   		lea	ecx, [rdx+1]
 592 05b5 8B55F8   		mov	edx, DWORD PTR [rbp-8]
 593 05b8 01CA     		add	edx, ecx
 594 05ba 4863D2   		movsx	rdx, edx
 595 05bd 48C1E203 		sal	rdx, 3
 596 05c1 4801D0   		add	rax, rdx
 597 05c4 488B10   		mov	rdx, QWORD PTR [rax]
 598 05c7 8B45E0   		mov	eax, DWORD PTR [rbp-32]
 599 05ca 8D4801   		lea	ecx, [rax+1]
 600 05cd 8B45FC   		mov	eax, DWORD PTR [rbp-4]
 601 05d0 01C8     		add	eax, ecx
 602 05d2 4898     		cdqe
 603 05d4 4801D0   		add	rax, rdx
 604 05d7 807DD801 		cmp	BYTE PTR [rbp-40], 1
 605 05db 7507     		jne	.L23
 606              		.loc 2 163 0 is_stmt 0 discriminator 1
 607 05dd BA0F0000 		mov	edx, 15
 607      00
 608 05e2 EB05     		jmp	.L24
 609              	.L23:
 610              		.loc 2 163 0 discriminator 2
 611 05e4 BA000000 		mov	edx, 0
 611      00
 612              	.L24:
 613              		.loc 2 163 0 discriminator 4
 614 05e9 8810     		mov	BYTE PTR [rax], dl
 164:./emulator.c  **** }
GAS LISTING /tmp/ccHswIXC.s 			page 16


 615              		.loc 2 164 0 is_stmt 1 discriminator 4
 616 05eb 90       		nop
 617 05ec 5D       		pop	rbp
 618              		.cfi_def_cfa 7, 8
 619 05ed C3       		ret
 620              		.cfi_endproc
 621              	.LFE5:
 623              		.globl	pga_emulator_get
 625              	pga_emulator_get:
 626              	.LFB6:
 165:./emulator.c  **** 
 166:./emulator.c  **** byte pga_emulator_get(struct pga_emulator * emulator, int x, int y, byte direction)
 167:./emulator.c  **** {
 627              		.loc 2 167 0
 628              		.cfi_startproc
 629 05ee 55       		push	rbp
 630              		.cfi_def_cfa_offset 16
 631              		.cfi_offset 6, -16
 632 05ef 4889E5   		mov	rbp, rsp
 633              		.cfi_def_cfa_register 6
 634 05f2 48897DF8 		mov	QWORD PTR [rbp-8], rdi
 635 05f6 8975F4   		mov	DWORD PTR [rbp-12], esi
 636 05f9 8955F0   		mov	DWORD PTR [rbp-16], edx
 637 05fc 89C8     		mov	eax, ecx
 638 05fe 8845EC   		mov	BYTE PTR [rbp-20], al
 168:./emulator.c  ****     return 0b1 == (emulator->states[x + 1][y + 1] >> direction) & 0b1;
 639              		.loc 2 168 0
 640 0601 488B45F8 		mov	rax, QWORD PTR [rbp-8]
 641 0605 488B4008 		mov	rax, QWORD PTR [rax+8]
 642 0609 8B55F4   		mov	edx, DWORD PTR [rbp-12]
 643 060c 4863D2   		movsx	rdx, edx
 644 060f 4883C201 		add	rdx, 1
 645 0613 48C1E203 		sal	rdx, 3
 646 0617 4801D0   		add	rax, rdx
 647 061a 488B00   		mov	rax, QWORD PTR [rax]
 648 061d 8B55F0   		mov	edx, DWORD PTR [rbp-16]
 649 0620 4863D2   		movsx	rdx, edx
 650 0623 4883C201 		add	rdx, 1
 651 0627 4801D0   		add	rax, rdx
 652 062a 0FB600   		movzx	eax, BYTE PTR [rax]
 653 062d 0FB6D0   		movzx	edx, al
 654 0630 0FB645EC 		movzx	eax, BYTE PTR [rbp-20]
 655 0634 89C1     		mov	ecx, eax
 656 0636 D3FA     		sar	edx, cl
 657 0638 89D0     		mov	eax, edx
 658 063a 83F801   		cmp	eax, 1
 659 063d 0F94C0   		sete	al
 169:./emulator.c  **** }...
 660              		.loc 2 169 0
 661 0640 5D       		pop	rbp
 662              		.cfi_def_cfa 7, 8
 663 0641 C3       		ret
 664              		.cfi_endproc
 665              	.LFE6:
 667              		.globl	lut_train
 669              	lut_train:
 670              	.LFB7:
GAS LISTING /tmp/ccHswIXC.s 			page 17


 671              		.file 3 "./luts.c"
   1:./luts.c      **** typedef unsigned char byte;
   2:./luts.c      **** 
   3:./luts.c      **** void lut_train(uint64 * node, byte (* func)(byte, int[]), int args[])
   4:./luts.c      **** {
 672              		.loc 3 4 0
 673              		.cfi_startproc
 674 0642 55       		push	rbp
 675              		.cfi_def_cfa_offset 16
 676              		.cfi_offset 6, -16
 677 0643 4889E5   		mov	rbp, rsp
 678              		.cfi_def_cfa_register 6
 679 0646 4883EC30 		sub	rsp, 48
 680 064a 48897DE8 		mov	QWORD PTR [rbp-24], rdi
 681 064e 488975E0 		mov	QWORD PTR [rbp-32], rsi
 682 0652 488955D8 		mov	QWORD PTR [rbp-40], rdx
   5:./luts.c      ****     byte outputs = 0b0;
 683              		.loc 3 5 0
 684 0656 C645FF00 		mov	BYTE PTR [rbp-1], 0
 685              	.LBB5:
   6:./luts.c      **** 
   7:./luts.c      ****     for (byte inputs = 0b0; inputs <= 0b1111; inputs++)
 686              		.loc 3 7 0
 687 065a C645FE00 		mov	BYTE PTR [rbp-2], 0
 688 065e EB43     		jmp	.L28
 689              	.L29:
   8:./luts.c      ****     {
   9:./luts.c      ****         *node |= (((uint64) func(inputs, args) & 0b1111) << (inputs << 2));
 690              		.loc 3 9 0 discriminator 3
 691 0660 0FB655FE 		movzx	edx, BYTE PTR [rbp-2]
 692 0664 488B4DD8 		mov	rcx, QWORD PTR [rbp-40]
 693 0668 488B45E0 		mov	rax, QWORD PTR [rbp-32]
 694 066c 4889CE   		mov	rsi, rcx
 695 066f 89D7     		mov	edi, edx
 696 0671 FFD0     		call	rax
 697 0673 0FB6C0   		movzx	eax, al
 698 0676 83E00F   		and	eax, 15
 699 0679 4889C2   		mov	rdx, rax
 700 067c 0FB645FE 		movzx	eax, BYTE PTR [rbp-2]
 701 0680 C1E002   		sal	eax, 2
 702 0683 89C1     		mov	ecx, eax
 703 0685 48D3E2   		sal	rdx, cl
 704 0688 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 705 068c 488B00   		mov	rax, QWORD PTR [rax]
 706 068f 4809C2   		or	rdx, rax
 707 0692 488B45E8 		mov	rax, QWORD PTR [rbp-24]
 708 0696 488910   		mov	QWORD PTR [rax], rdx
   7:./luts.c      ****     {
 709              		.loc 3 7 0 discriminator 3
 710 0699 0FB645FE 		movzx	eax, BYTE PTR [rbp-2]
 711 069d 83C001   		add	eax, 1
 712 06a0 8845FE   		mov	BYTE PTR [rbp-2], al
 713              	.L28:
   7:./luts.c      ****     {
 714              		.loc 3 7 0 is_stmt 0 discriminator 1
 715 06a3 807DFE0F 		cmp	BYTE PTR [rbp-2], 15
 716 06a7 76B7     		jbe	.L29
GAS LISTING /tmp/ccHswIXC.s 			page 18


 717              	.LBE5:
  10:./luts.c      ****     }
  11:./luts.c      **** }
 718              		.loc 3 11 0 is_stmt 1
 719 06a9 90       		nop
 720 06aa C9       		leave
 721              		.cfi_def_cfa 7, 8
 722 06ab C3       		ret
 723              		.cfi_endproc
 724              	.LFE7:
 726              		.globl	lut_wire_function
 728              	lut_wire_function:
 729              	.LFB8:
  12:./luts.c      **** 
  13:./luts.c      **** byte lut_wire_function(byte inputs, int args[])
  14:./luts.c      **** {
 730              		.loc 3 14 0
 731              		.cfi_startproc
 732 06ac 55       		push	rbp
 733              		.cfi_def_cfa_offset 16
 734              		.cfi_offset 6, -16
 735 06ad 4889E5   		mov	rbp, rsp
 736              		.cfi_def_cfa_register 6
 737 06b0 89F8     		mov	eax, edi
 738 06b2 488975F0 		mov	QWORD PTR [rbp-16], rsi
 739 06b6 8845FC   		mov	BYTE PTR [rbp-4], al
  15:./luts.c      ****     return ((inputs >> args[0]) & 0b1) << args[1];
 740              		.loc 3 15 0
 741 06b9 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 742 06bd 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 743 06c1 8B00     		mov	eax, DWORD PTR [rax]
 744 06c3 89C1     		mov	ecx, eax
 745 06c5 D3FA     		sar	edx, cl
 746 06c7 89D0     		mov	eax, edx
 747 06c9 83E001   		and	eax, 1
 748 06cc 89C2     		mov	edx, eax
 749 06ce 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 750 06d2 4883C004 		add	rax, 4
 751 06d6 8B00     		mov	eax, DWORD PTR [rax]
 752 06d8 89C1     		mov	ecx, eax
 753 06da D3E2     		sal	edx, cl
 754 06dc 89D0     		mov	eax, edx
  16:./luts.c      **** }
 755              		.loc 3 16 0
 756 06de 5D       		pop	rbp
 757              		.cfi_def_cfa 7, 8
 758 06df C3       		ret
 759              		.cfi_endproc
 760              	.LFE8:
 762              		.globl	lut_not_function
 764              	lut_not_function:
 765              	.LFB9:
  17:./luts.c      **** 
  18:./luts.c      **** byte lut_not_function(byte inputs, int args[])
  19:./luts.c      **** {
 766              		.loc 3 19 0
 767              		.cfi_startproc
GAS LISTING /tmp/ccHswIXC.s 			page 19


 768 06e0 55       		push	rbp
 769              		.cfi_def_cfa_offset 16
 770              		.cfi_offset 6, -16
 771 06e1 4889E5   		mov	rbp, rsp
 772              		.cfi_def_cfa_register 6
 773 06e4 89F8     		mov	eax, edi
 774 06e6 488975F0 		mov	QWORD PTR [rbp-16], rsi
 775 06ea 8845FC   		mov	BYTE PTR [rbp-4], al
  20:./luts.c      ****     return (~(inputs >> args[0]) & 0b1) << args[1];
 776              		.loc 3 20 0
 777 06ed 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 778 06f1 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 779 06f5 8B00     		mov	eax, DWORD PTR [rax]
 780 06f7 89C1     		mov	ecx, eax
 781 06f9 D3FA     		sar	edx, cl
 782 06fb 89D0     		mov	eax, edx
 783 06fd 83E001   		and	eax, 1
 784 0700 85C0     		test	eax, eax
 785 0702 0F94C0   		sete	al
 786 0705 0FB6D0   		movzx	edx, al
 787 0708 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 788 070c 4883C004 		add	rax, 4
 789 0710 8B00     		mov	eax, DWORD PTR [rax]
 790 0712 89C1     		mov	ecx, eax
 791 0714 D3E2     		sal	edx, cl
 792 0716 89D0     		mov	eax, edx
  21:./luts.c      **** }
 793              		.loc 3 21 0
 794 0718 5D       		pop	rbp
 795              		.cfi_def_cfa 7, 8
 796 0719 C3       		ret
 797              		.cfi_endproc
 798              	.LFE9:
 800              		.globl	lut_and_function
 802              	lut_and_function:
 803              	.LFB10:
  22:./luts.c      **** 
  23:./luts.c      **** byte lut_and_function(byte inputs, int args[])
  24:./luts.c      **** {
 804              		.loc 3 24 0
 805              		.cfi_startproc
 806 071a 55       		push	rbp
 807              		.cfi_def_cfa_offset 16
 808              		.cfi_offset 6, -16
 809 071b 4889E5   		mov	rbp, rsp
 810              		.cfi_def_cfa_register 6
 811 071e 89F8     		mov	eax, edi
 812 0720 488975F0 		mov	QWORD PTR [rbp-16], rsi
 813 0724 8845FC   		mov	BYTE PTR [rbp-4], al
  25:./luts.c      ****     return (((inputs >> args[0]) & 0b1) & ((inputs >> args[1]) & 0b1)) << args[2];
 814              		.loc 3 25 0
 815 0727 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 816 072b 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 817 072f 8B00     		mov	eax, DWORD PTR [rax]
 818 0731 89D6     		mov	esi, edx
 819 0733 89C1     		mov	ecx, eax
 820 0735 D3FE     		sar	esi, cl
GAS LISTING /tmp/ccHswIXC.s 			page 20


 821 0737 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 822 073b 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 823 073f 4883C004 		add	rax, 4
 824 0743 8B00     		mov	eax, DWORD PTR [rax]
 825 0745 89C1     		mov	ecx, eax
 826 0747 D3FA     		sar	edx, cl
 827 0749 89D0     		mov	eax, edx
 828 074b 21F0     		and	eax, esi
 829 074d 83E001   		and	eax, 1
 830 0750 89C2     		mov	edx, eax
 831 0752 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 832 0756 4883C008 		add	rax, 8
 833 075a 8B00     		mov	eax, DWORD PTR [rax]
 834 075c 89C1     		mov	ecx, eax
 835 075e D3E2     		sal	edx, cl
 836 0760 89D0     		mov	eax, edx
  26:./luts.c      **** }
 837              		.loc 3 26 0
 838 0762 5D       		pop	rbp
 839              		.cfi_def_cfa 7, 8
 840 0763 C3       		ret
 841              		.cfi_endproc
 842              	.LFE10:
 844              		.globl	lut_or_function
 846              	lut_or_function:
 847              	.LFB11:
  27:./luts.c      **** 
  28:./luts.c      **** byte lut_or_function(byte inputs, int args[])
  29:./luts.c      **** {
 848              		.loc 3 29 0
 849              		.cfi_startproc
 850 0764 55       		push	rbp
 851              		.cfi_def_cfa_offset 16
 852              		.cfi_offset 6, -16
 853 0765 4889E5   		mov	rbp, rsp
 854              		.cfi_def_cfa_register 6
 855 0768 89F8     		mov	eax, edi
 856 076a 488975F0 		mov	QWORD PTR [rbp-16], rsi
 857 076e 8845FC   		mov	BYTE PTR [rbp-4], al
  30:./luts.c      ****     return (((inputs >> args[0]) & 0b1) | ((inputs >> args[1]) & 0b1)) << args[2];
 858              		.loc 3 30 0
 859 0771 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 860 0775 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 861 0779 8B00     		mov	eax, DWORD PTR [rax]
 862 077b 89D6     		mov	esi, edx
 863 077d 89C1     		mov	ecx, eax
 864 077f D3FE     		sar	esi, cl
 865 0781 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 866 0785 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 867 0789 4883C004 		add	rax, 4
 868 078d 8B00     		mov	eax, DWORD PTR [rax]
 869 078f 89C1     		mov	ecx, eax
 870 0791 D3FA     		sar	edx, cl
 871 0793 89D0     		mov	eax, edx
 872 0795 09F0     		or	eax, esi
 873 0797 83E001   		and	eax, 1
 874 079a 89C2     		mov	edx, eax
GAS LISTING /tmp/ccHswIXC.s 			page 21


 875 079c 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 876 07a0 4883C008 		add	rax, 8
 877 07a4 8B00     		mov	eax, DWORD PTR [rax]
 878 07a6 89C1     		mov	ecx, eax
 879 07a8 D3E2     		sal	edx, cl
 880 07aa 89D0     		mov	eax, edx
  31:./luts.c      **** }
 881              		.loc 3 31 0
 882 07ac 5D       		pop	rbp
 883              		.cfi_def_cfa 7, 8
 884 07ad C3       		ret
 885              		.cfi_endproc
 886              	.LFE11:
 888              		.globl	lut_xor_function
 890              	lut_xor_function:
 891              	.LFB12:
  32:./luts.c      **** 
  33:./luts.c      **** byte lut_xor_function(byte inputs, int args[])
  34:./luts.c      **** {
 892              		.loc 3 34 0
 893              		.cfi_startproc
 894 07ae 55       		push	rbp
 895              		.cfi_def_cfa_offset 16
 896              		.cfi_offset 6, -16
 897 07af 4889E5   		mov	rbp, rsp
 898              		.cfi_def_cfa_register 6
 899 07b2 89F8     		mov	eax, edi
 900 07b4 488975F0 		mov	QWORD PTR [rbp-16], rsi
 901 07b8 8845FC   		mov	BYTE PTR [rbp-4], al
  35:./luts.c      ****     return (((inputs >> args[0]) & 0b1) ^ ((inputs >> args[1]) & 0b1)) << args[2];
 902              		.loc 3 35 0
 903 07bb 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 904 07bf 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 905 07c3 8B00     		mov	eax, DWORD PTR [rax]
 906 07c5 89D6     		mov	esi, edx
 907 07c7 89C1     		mov	ecx, eax
 908 07c9 D3FE     		sar	esi, cl
 909 07cb 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 910 07cf 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 911 07d3 4883C004 		add	rax, 4
 912 07d7 8B00     		mov	eax, DWORD PTR [rax]
 913 07d9 89C1     		mov	ecx, eax
 914 07db D3FA     		sar	edx, cl
 915 07dd 89D0     		mov	eax, edx
 916 07df 31F0     		xor	eax, esi
 917 07e1 83E001   		and	eax, 1
 918 07e4 89C2     		mov	edx, eax
 919 07e6 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 920 07ea 4883C008 		add	rax, 8
 921 07ee 8B00     		mov	eax, DWORD PTR [rax]
 922 07f0 89C1     		mov	ecx, eax
 923 07f2 D3E2     		sal	edx, cl
 924 07f4 89D0     		mov	eax, edx
  36:./luts.c      **** }
 925              		.loc 3 36 0
 926 07f6 5D       		pop	rbp
 927              		.cfi_def_cfa 7, 8
GAS LISTING /tmp/ccHswIXC.s 			page 22


 928 07f7 C3       		ret
 929              		.cfi_endproc
 930              	.LFE12:
 932              		.globl	lut_nor_function
 934              	lut_nor_function:
 935              	.LFB13:
  37:./luts.c      **** 
  38:./luts.c      **** byte lut_nor_function(byte inputs, int args[])
  39:./luts.c      **** {
 936              		.loc 3 39 0
 937              		.cfi_startproc
 938 07f8 55       		push	rbp
 939              		.cfi_def_cfa_offset 16
 940              		.cfi_offset 6, -16
 941 07f9 4889E5   		mov	rbp, rsp
 942              		.cfi_def_cfa_register 6
 943 07fc 89F8     		mov	eax, edi
 944 07fe 488975F0 		mov	QWORD PTR [rbp-16], rsi
 945 0802 8845FC   		mov	BYTE PTR [rbp-4], al
  40:./luts.c      ****     return (~(((inputs >> args[0]) & 0b1) | ((inputs >> args[1]) & 0b1)) & 0b1) << args[2];
 946              		.loc 3 40 0
 947 0805 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 948 0809 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 949 080d 8B00     		mov	eax, DWORD PTR [rax]
 950 080f 89D6     		mov	esi, edx
 951 0811 89C1     		mov	ecx, eax
 952 0813 D3FE     		sar	esi, cl
 953 0815 0FB655FC 		movzx	edx, BYTE PTR [rbp-4]
 954 0819 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 955 081d 4883C004 		add	rax, 4
 956 0821 8B00     		mov	eax, DWORD PTR [rax]
 957 0823 89C1     		mov	ecx, eax
 958 0825 D3FA     		sar	edx, cl
 959 0827 89D0     		mov	eax, edx
 960 0829 09F0     		or	eax, esi
 961 082b 83E001   		and	eax, 1
 962 082e 85C0     		test	eax, eax
 963 0830 0F94C0   		sete	al
 964 0833 0FB6D0   		movzx	edx, al
 965 0836 488B45F0 		mov	rax, QWORD PTR [rbp-16]
 966 083a 4883C008 		add	rax, 8
 967 083e 8B00     		mov	eax, DWORD PTR [rax]
 968 0840 89C1     		mov	ecx, eax
 969 0842 D3E2     		sal	edx, cl
 970 0844 89D0     		mov	eax, edx
  41:./luts.c      **** }...
 971              		.loc 3 41 0
 972 0846 5D       		pop	rbp
 973              		.cfi_def_cfa 7, 8
 974 0847 C3       		ret
 975              		.cfi_endproc
 976              	.LFE13:
 978              		.section	.rodata
 979              	.LC0:
 980 0000 49746572 		.string	"Iterations: %i\n"
 980      6174696F 
 980      6E733A20 
GAS LISTING /tmp/ccHswIXC.s 			page 23


 980      25690A00 
 981              	.LC1:
 982 0010 53746174 		.string	"State: %i\n"
 982      653A2025 
 982      690A00
 983              		.text
 984              		.globl	main
 986              	main:
 987              	.LFB14:
 988              		.file 4 "pga.c"
   1:pga.c         **** #include <stdio.h>
   2:pga.c         **** #include "./emulator.c"
   3:pga.c         **** #include "./luts.c"
   4:pga.c         **** 
   5:pga.c         **** int main()
   6:pga.c         **** {
 989              		.loc 4 6 0
 990              		.cfi_startproc
 991 0848 55       		push	rbp
 992              		.cfi_def_cfa_offset 16
 993              		.cfi_offset 6, -16
 994 0849 4889E5   		mov	rbp, rsp
 995              		.cfi_def_cfa_register 6
 996 084c 4881ECC0 		sub	rsp, 192
 996      000000
 997              		.loc 4 6 0
 998 0853 64488B04 		mov	rax, QWORD PTR fs:40
 998      25280000 
 998      00
 999 085c 488945F8 		mov	QWORD PTR [rbp-8], rax
 1000 0860 31C0     		xor	eax, eax
   7:pga.c         ****     struct pga_table * table = pga_table_create(3, 3);
 1001              		.loc 4 7 0
 1002 0862 BE030000 		mov	esi, 3
 1002      00
 1003 0867 BF030000 		mov	edi, 3
 1003      00
 1004 086c E8000000 		call	pga_table_create
 1004      00
 1005 0871 48898550 		mov	QWORD PTR [rbp-176], rax
 1005      FFFFFF
   8:pga.c         ****     struct pga_emulator * emulator = pga_emulator_create(table);
 1006              		.loc 4 8 0
 1007 0878 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1007      FFFFFF
 1008 087f 4889C7   		mov	rdi, rax
 1009 0882 E8000000 		call	pga_emulator_create
 1009      00
 1010 0887 48898558 		mov	QWORD PTR [rbp-168], rax
 1010      FFFFFF
   9:pga.c         **** 
  10:pga.c         ****     lut_train(&table->matrix[0][0], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});
 1011              		.loc 4 10 0
 1012 088e C78560FF 		mov	DWORD PTR [rbp-160], 3
 1012      FFFF0300 
 1012      0000
 1013 0898 C78564FF 		mov	DWORD PTR [rbp-156], 1
GAS LISTING /tmp/ccHswIXC.s 			page 24


 1013      FFFF0100 
 1013      0000
 1014 08a2 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1014      FFFFFF
 1015 08a9 488B00   		mov	rax, QWORD PTR [rax]
 1016 08ac 488B00   		mov	rax, QWORD PTR [rax]
 1017 08af 488D9560 		lea	rdx, [rbp-160]
 1017      FFFFFF
 1018 08b6 BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1018      00
 1019 08bb 4889C7   		mov	rdi, rax
 1020 08be E8000000 		call	lut_train
 1020      00
  11:pga.c         ****     lut_train(&table->matrix[0][2], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});
 1021              		.loc 4 11 0
 1022 08c3 C78570FF 		mov	DWORD PTR [rbp-144], 3
 1022      FFFF0300 
 1022      0000
 1023 08cd C78574FF 		mov	DWORD PTR [rbp-140], 1
 1023      FFFF0100 
 1023      0000
 1024 08d7 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1024      FFFFFF
 1025 08de 488B00   		mov	rax, QWORD PTR [rax]
 1026 08e1 488B00   		mov	rax, QWORD PTR [rax]
 1027 08e4 488D4810 		lea	rcx, [rax+16]
 1028 08e8 488D8570 		lea	rax, [rbp-144]
 1028      FFFFFF
 1029 08ef 4889C2   		mov	rdx, rax
 1030 08f2 BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1030      00
 1031 08f7 4889CF   		mov	rdi, rcx
 1032 08fa E8000000 		call	lut_train
 1032      00
  12:pga.c         **** 
  13:pga.c         ****     lut_train(&table->matrix[1][1], lut_wire_function, (int[2]) {NODE_UP, NODE_BOTTOM});
 1033              		.loc 4 13 0
 1034 08ff C7458000 		mov	DWORD PTR [rbp-128], 0
 1034      000000
 1035 0906 C7458402 		mov	DWORD PTR [rbp-124], 2
 1035      000000
 1036 090d 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1036      FFFFFF
 1037 0914 488B00   		mov	rax, QWORD PTR [rax]
 1038 0917 4883C008 		add	rax, 8
 1039 091b 488B00   		mov	rax, QWORD PTR [rax]
 1040 091e 488D4808 		lea	rcx, [rax+8]
 1041 0922 488D4580 		lea	rax, [rbp-128]
 1042 0926 4889C2   		mov	rdx, rax
 1043 0929 BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1043      00
 1044 092e 4889CF   		mov	rdi, rcx
 1045 0931 E8000000 		call	lut_train
 1045      00
  14:pga.c         ****     lut_train(&table->matrix[2][0], lut_wire_function, (int[2]) {NODE_BOTTOM, NODE_LEFT});
 1046              		.loc 4 14 0
 1047 0936 C7459002 		mov	DWORD PTR [rbp-112], 2
GAS LISTING /tmp/ccHswIXC.s 			page 25


 1047      000000
 1048 093d C7459403 		mov	DWORD PTR [rbp-108], 3
 1048      000000
 1049 0944 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1049      FFFFFF
 1050 094b 488B00   		mov	rax, QWORD PTR [rax]
 1051 094e 4883C010 		add	rax, 16
 1052 0952 488B00   		mov	rax, QWORD PTR [rax]
 1053 0955 488D5590 		lea	rdx, [rbp-112]
 1054 0959 BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1054      00
 1055 095e 4889C7   		mov	rdi, rax
 1056 0961 E8000000 		call	lut_train
 1056      00
  15:pga.c         ****     lut_train(&table->matrix[2][1], lut_wire_function, (int[2]) {NODE_BOTTOM, NODE_UP});
 1057              		.loc 4 15 0
 1058 0966 C745A002 		mov	DWORD PTR [rbp-96], 2
 1058      000000
 1059 096d C745A400 		mov	DWORD PTR [rbp-92], 0
 1059      000000
 1060 0974 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1060      FFFFFF
 1061 097b 488B00   		mov	rax, QWORD PTR [rax]
 1062 097e 4883C010 		add	rax, 16
 1063 0982 488B00   		mov	rax, QWORD PTR [rax]
 1064 0985 488D4808 		lea	rcx, [rax+8]
 1065 0989 488D45A0 		lea	rax, [rbp-96]
 1066 098d 4889C2   		mov	rdx, rax
 1067 0990 BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1067      00
 1068 0995 4889CF   		mov	rdi, rcx
 1069 0998 E8000000 		call	lut_train
 1069      00
  16:pga.c         ****     
  17:pga.c         ****     lut_train(&table->matrix[2][2], lut_wire_function, (int[2]) {NODE_LEFT, NODE_UP});
 1070              		.loc 4 17 0
 1071 099d C745B003 		mov	DWORD PTR [rbp-80], 3
 1071      000000
 1072 09a4 C745B400 		mov	DWORD PTR [rbp-76], 0
 1072      000000
 1073 09ab 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1073      FFFFFF
 1074 09b2 488B00   		mov	rax, QWORD PTR [rax]
 1075 09b5 4883C010 		add	rax, 16
 1076 09b9 488B00   		mov	rax, QWORD PTR [rax]
 1077 09bc 488D4810 		lea	rcx, [rax+16]
 1078 09c0 488D45B0 		lea	rax, [rbp-80]
 1079 09c4 4889C2   		mov	rdx, rax
 1080 09c7 BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1080      00
 1081 09cc 4889CF   		mov	rdi, rcx
 1082 09cf E8000000 		call	lut_train
 1082      00
  18:pga.c         ****     lut_train(&table->matrix[2][2], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});
 1083              		.loc 4 18 0
 1084 09d4 C745C003 		mov	DWORD PTR [rbp-64], 3
 1084      000000
GAS LISTING /tmp/ccHswIXC.s 			page 26


 1085 09db C745C401 		mov	DWORD PTR [rbp-60], 1
 1085      000000
 1086 09e2 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1086      FFFFFF
 1087 09e9 488B00   		mov	rax, QWORD PTR [rax]
 1088 09ec 4883C010 		add	rax, 16
 1089 09f0 488B00   		mov	rax, QWORD PTR [rax]
 1090 09f3 488D4810 		lea	rcx, [rax+16]
 1091 09f7 488D45C0 		lea	rax, [rbp-64]
 1092 09fb 4889C2   		mov	rdx, rax
 1093 09fe BE000000 		mov	esi, OFFSET FLAT:lut_wire_function
 1093      00
 1094 0a03 4889CF   		mov	rdi, rcx
 1095 0a06 E8000000 		call	lut_train
 1095      00
  19:pga.c         **** 
  20:pga.c         ****     lut_train(&table->matrix[1][0], lut_nor_function, (int[3]) {NODE_LEFT, NODE_RIGHT, NODE_BOTTOM}
 1096              		.loc 4 20 0
 1097 0a0b C745D003 		mov	DWORD PTR [rbp-48], 3
 1097      000000
 1098 0a12 C745D401 		mov	DWORD PTR [rbp-44], 1
 1098      000000
 1099 0a19 C745D802 		mov	DWORD PTR [rbp-40], 2
 1099      000000
 1100 0a20 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1100      FFFFFF
 1101 0a27 488B00   		mov	rax, QWORD PTR [rax]
 1102 0a2a 4883C008 		add	rax, 8
 1103 0a2e 488B00   		mov	rax, QWORD PTR [rax]
 1104 0a31 488D55D0 		lea	rdx, [rbp-48]
 1105 0a35 BE000000 		mov	esi, OFFSET FLAT:lut_nor_function
 1105      00
 1106 0a3a 4889C7   		mov	rdi, rax
 1107 0a3d E8000000 		call	lut_train
 1107      00
  21:pga.c         ****     lut_train(&table->matrix[1][2], lut_nor_function, (int[3]) {NODE_LEFT, NODE_UP, NODE_RIGHT});
 1108              		.loc 4 21 0
 1109 0a42 C745E003 		mov	DWORD PTR [rbp-32], 3
 1109      000000
 1110 0a49 C745E400 		mov	DWORD PTR [rbp-28], 0
 1110      000000
 1111 0a50 C745E801 		mov	DWORD PTR [rbp-24], 1
 1111      000000
 1112 0a57 488B8550 		mov	rax, QWORD PTR [rbp-176]
 1112      FFFFFF
 1113 0a5e 488B00   		mov	rax, QWORD PTR [rax]
 1114 0a61 4883C008 		add	rax, 8
 1115 0a65 488B00   		mov	rax, QWORD PTR [rax]
 1116 0a68 488D4810 		lea	rcx, [rax+16]
 1117 0a6c 488D45E0 		lea	rax, [rbp-32]
 1118 0a70 4889C2   		mov	rdx, rax
 1119 0a73 BE000000 		mov	esi, OFFSET FLAT:lut_nor_function
 1119      00
 1120 0a78 4889CF   		mov	rdi, rcx
 1121 0a7b E8000000 		call	lut_train
 1121      00
  22:pga.c         **** 
GAS LISTING /tmp/ccHswIXC.s 			page 27


  23:pga.c         ****     pga_emulator_set(emulator, 0, 0, NODE_LEFT, 1);
 1122              		.loc 4 23 0
 1123 0a80 488B8558 		mov	rax, QWORD PTR [rbp-168]
 1123      FFFFFF
 1124 0a87 41B80100 		mov	r8d, 1
 1124      0000
 1125 0a8d B9030000 		mov	ecx, 3
 1125      00
 1126 0a92 BA000000 		mov	edx, 0
 1126      00
 1127 0a97 BE000000 		mov	esi, 0
 1127      00
 1128 0a9c 4889C7   		mov	rdi, rax
 1129 0a9f E8000000 		call	pga_emulator_set
 1129      00
  24:pga.c         ****     pga_emulator_set(emulator, 0, 2, NODE_LEFT, 0);
 1130              		.loc 4 24 0
 1131 0aa4 488B8558 		mov	rax, QWORD PTR [rbp-168]
 1131      FFFFFF
 1132 0aab 41B80000 		mov	r8d, 0
 1132      0000
 1133 0ab1 B9030000 		mov	ecx, 3
 1133      00
 1134 0ab6 BA020000 		mov	edx, 2
 1134      00
 1135 0abb BE000000 		mov	esi, 0
 1135      00
 1136 0ac0 4889C7   		mov	rdi, rax
 1137 0ac3 E8000000 		call	pga_emulator_set
 1137      00
  25:pga.c         **** 
  26:pga.c         ****     int iterations = pga_emulator_render(emulator);
 1138              		.loc 4 26 0
 1139 0ac8 488B8558 		mov	rax, QWORD PTR [rbp-168]
 1139      FFFFFF
 1140 0acf 4889C7   		mov	rdi, rax
 1141 0ad2 E8000000 		call	pga_emulator_render
 1141      00
 1142 0ad7 89854CFF 		mov	DWORD PTR [rbp-180], eax
 1142      FFFF
  27:pga.c         **** 
  28:pga.c         ****     printf("Iterations: %i\n", iterations);
 1143              		.loc 4 28 0
 1144 0add 8B854CFF 		mov	eax, DWORD PTR [rbp-180]
 1144      FFFF
 1145 0ae3 89C6     		mov	esi, eax
 1146 0ae5 BF000000 		mov	edi, OFFSET FLAT:.LC0
 1146      00
 1147 0aea B8000000 		mov	eax, 0
 1147      00
 1148 0aef E8000000 		call	printf
 1148      00
  29:pga.c         ****     printf("State: %i\n", pga_emulator_get(emulator, 2, 2, NODE_RIGHT));
 1149              		.loc 4 29 0
 1150 0af4 488B8558 		mov	rax, QWORD PTR [rbp-168]
 1150      FFFFFF
 1151 0afb B9010000 		mov	ecx, 1
GAS LISTING /tmp/ccHswIXC.s 			page 28


 1151      00
 1152 0b00 BA020000 		mov	edx, 2
 1152      00
 1153 0b05 BE020000 		mov	esi, 2
 1153      00
 1154 0b0a 4889C7   		mov	rdi, rax
 1155 0b0d E8000000 		call	pga_emulator_get
 1155      00
 1156 0b12 0FB6C0   		movzx	eax, al
 1157 0b15 89C6     		mov	esi, eax
 1158 0b17 BF000000 		mov	edi, OFFSET FLAT:.LC1
 1158      00
 1159 0b1c B8000000 		mov	eax, 0
 1159      00
 1160 0b21 E8000000 		call	printf
 1160      00
  30:pga.c         **** 
  31:pga.c         ****     return 0;
 1161              		.loc 4 31 0
 1162 0b26 B8000000 		mov	eax, 0
 1162      00
  32:pga.c         **** }...
 1163              		.loc 4 32 0
 1164 0b2b 488B4DF8 		mov	rcx, QWORD PTR [rbp-8]
 1165 0b2f 6448330C 		xor	rcx, QWORD PTR fs:40
 1165      25280000 
 1165      00
 1166 0b38 7405     		je	.L44
 1167 0b3a E8000000 		call	__stack_chk_fail
 1167      00
 1168              	.L44:
 1169 0b3f C9       		leave
 1170              		.cfi_def_cfa 7, 8
 1171 0b40 C3       		ret
 1172              		.cfi_endproc
 1173              	.LFE14:
 1175              	.Letext0:
 1176              		.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
GAS LISTING /tmp/ccHswIXC.s 			page 29


DEFINED SYMBOLS
                            *ABS*:0000000000000000 pga.c
     /tmp/ccHswIXC.s:7      .text:0000000000000000 pga_table_create
     /tmp/ccHswIXC.s:87     .text:00000000000000ae pga_emulator_create
     /tmp/ccHswIXC.s:209    .text:00000000000001c4 pga_emulator_render
     /tmp/ccHswIXC.s:514    .text:0000000000000502 pga_emulator_set
     /tmp/ccHswIXC.s:625    .text:00000000000005ee pga_emulator_get
     /tmp/ccHswIXC.s:669    .text:0000000000000642 lut_train
     /tmp/ccHswIXC.s:728    .text:00000000000006ac lut_wire_function
     /tmp/ccHswIXC.s:764    .text:00000000000006e0 lut_not_function
     /tmp/ccHswIXC.s:802    .text:000000000000071a lut_and_function
     /tmp/ccHswIXC.s:846    .text:0000000000000764 lut_or_function
     /tmp/ccHswIXC.s:890    .text:00000000000007ae lut_xor_function
     /tmp/ccHswIXC.s:934    .text:00000000000007f8 lut_nor_function
     /tmp/ccHswIXC.s:986    .text:0000000000000848 main

UNDEFINED SYMBOLS
malloc
printf
__stack_chk_fail
