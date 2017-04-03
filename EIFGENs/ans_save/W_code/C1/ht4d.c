/*
 * Class HTTPD_CONTROLLER
 */

#include "eif_macros.h"


#ifdef __cplusplus
extern "C" {
#endif

static const EIF_TYPE_INDEX egt_0_4 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_1_4 [] = {0xFF01,324,3,0xFFFF};
static const EIF_TYPE_INDEX egt_2_4 [] = {0xFF01,3,0xFFFF};
static const EIF_TYPE_INDEX egt_3_4 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_4_4 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_5_4 [] = {0xFF01,3,0xFFFF};
static const EIF_TYPE_INDEX egt_6_4 [] = {0xFF01,3,0xFFFF};
static const EIF_TYPE_INDEX egt_7_4 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_8_4 [] = {0xFF01,20,0xFFFF};
static const EIF_TYPE_INDEX egt_9_4 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_10_4 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_11_4 [] = {0xFF01,21,0xFFFF};
static const EIF_TYPE_INDEX egt_12_4 [] = {0xFF01,3,0xFFFF};


static const struct desc_info desc_4[] = {
	{EIF_GENERIC(NULL), 0xFFFFFFFF, 0xFFFFFFFF},
	{EIF_GENERIC(egt_0_4), 0, 0xFFFFFFFF},
	{EIF_GENERIC(egt_1_4), 1, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 3, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 4, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 5, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 6, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 7, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 8, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 9, 0xFFFFFFFF},
	{EIF_GENERIC(egt_2_4), 10, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 11, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 12, 0xFFFFFFFF},
	{EIF_GENERIC(egt_3_4), 13, 0xFFFFFFFF},
	{EIF_GENERIC(egt_4_4), 14, 0xFFFFFFFF},
	{EIF_GENERIC(egt_5_4), 15, 0xFFFFFFFF},
	{EIF_GENERIC(egt_6_4), 16, 0xFFFFFFFF},
	{EIF_GENERIC(egt_7_4), 17, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 18, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 19, 0xFFFFFFFF},
	{EIF_GENERIC(egt_8_4), 20, 0xFFFFFFFF},
	{EIF_GENERIC(egt_9_4), 21, 0xFFFFFFFF},
	{EIF_GENERIC(egt_10_4), 22, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 23, 0xFFFFFFFF},
	{EIF_GENERIC(egt_11_4), 24, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 25, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 26, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 27, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x07 /*3*/), 28, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x023D /*286*/), 29, 0xFFFFFFFF},
	{EIF_GENERIC(egt_12_4), 30, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 88, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 89, 0},
};
void Init4(void)
{
	IDSC(desc_4, 0, 3);
	IDSC(desc_4 + 1, 2, 3);
	IDSC(desc_4 + 32, 316, 3);
}


#ifdef __cplusplus
}
#endif