/*
 * Class HTTPD_REQUEST_HANDLER
 */

#include "eif_macros.h"


#ifdef __cplusplus
extern "C" {
#endif

static const EIF_TYPE_INDEX egt_0_159 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_1_159 [] = {0xFF01,324,158,0xFFFF};
static const EIF_TYPE_INDEX egt_2_159 [] = {0xFF01,158,0xFFFF};
static const EIF_TYPE_INDEX egt_3_159 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_4_159 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_5_159 [] = {0xFF01,158,0xFFFF};
static const EIF_TYPE_INDEX egt_6_159 [] = {0xFF01,158,0xFFFF};
static const EIF_TYPE_INDEX egt_7_159 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_8_159 [] = {0xFF01,20,0xFFFF};
static const EIF_TYPE_INDEX egt_9_159 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_10_159 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_11_159 [] = {0xFF01,21,0xFFFF};
static const EIF_TYPE_INDEX egt_12_159 [] = {0xFF01,158,0xFFFF};
static const EIF_TYPE_INDEX egt_13_159 [] = {0xFF01,2,0xFFFF};
static const EIF_TYPE_INDEX egt_14_159 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_15_159 [] = {0xFF01,503,0xFF01,296,0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_16_159 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_17_159 [] = {0xFF01,296,0xFFFF};
static const EIF_TYPE_INDEX egt_18_159 [] = {0xFFF9,3,245,0xFF01,296,0xFF01,296,247,0xFFFF};


static const struct desc_info desc_159[] = {
	{EIF_GENERIC(NULL), 0xFFFFFFFF, 0xFFFFFFFF},
	{EIF_GENERIC(egt_0_159), 0, 0xFFFFFFFF},
	{EIF_GENERIC(egt_1_159), 1, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 3, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 4, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 5, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 6, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 7, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 8, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 9, 0xFFFFFFFF},
	{EIF_GENERIC(egt_2_159), 10, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 11, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 12, 0xFFFFFFFF},
	{EIF_GENERIC(egt_3_159), 13, 0xFFFFFFFF},
	{EIF_GENERIC(egt_4_159), 14, 0xFFFFFFFF},
	{EIF_GENERIC(egt_5_159), 15, 0xFFFFFFFF},
	{EIF_GENERIC(egt_6_159), 16, 0xFFFFFFFF},
	{EIF_GENERIC(egt_7_159), 17, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 18, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 19, 0xFFFFFFFF},
	{EIF_GENERIC(egt_8_159), 20, 0xFFFFFFFF},
	{EIF_GENERIC(egt_9_159), 21, 0xFFFFFFFF},
	{EIF_GENERIC(egt_10_159), 22, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 23, 0xFFFFFFFF},
	{EIF_GENERIC(egt_11_159), 24, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 25, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 26, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 27, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x013D /*158*/), 28, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x023D /*286*/), 29, 0xFFFFFFFF},
	{EIF_GENERIC(egt_12_159), 30, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2038, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01EF /*247*/), 2039, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2041, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2042, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2043, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2044, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x05 /*2*/), 2045, 0},
	{EIF_GENERIC(egt_13_159), 2046, 0xFFFFFFFF},
	{EIF_GENERIC(egt_14_159), 2047, 8},
	{EIF_GENERIC(egt_15_159), 2048, 16},
	{EIF_GENERIC(egt_16_159), 2049, 24},
	{EIF_GENERIC(egt_17_159), 2050, 32},
	{EIF_NON_GENERIC(0x0251 /*296*/), 2051, 40},
	{EIF_GENERIC(egt_18_159), 2052, 48},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2053, 64},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2054, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2055, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2056, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2057, 65},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2072, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01EF /*247*/), 2059, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0231 /*280*/), 2060, 66},
	{EIF_GENERIC(NULL), 2061, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2062, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2063, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2064, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2065, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 0x00, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2066, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2067, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0251 /*296*/), 2068, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x43 /*33*/), 2069, 56},
	{EIF_GENERIC(NULL), 2070, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 2071, 0xFFFFFFFF},
};
void Init159(void)
{
	IDSC(desc_159, 0, 158);
	IDSC(desc_159 + 1, 2, 158);
	IDSC(desc_159 + 32, 344, 158);
	IDSC(desc_159 + 34, 377, 158);
}


#ifdef __cplusplus
}
#endif