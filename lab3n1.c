#include <stdio.h>
#include <math.h>
#define countmass  8
void corr(int massx[countmass], int massy[countmass], float *rezult){
	int i = 0; 
	float summcor=0;
	for(i=0;i<countmass;i++){
		summcor = summcor + (massx[i]*massy[i]);
	}
	*rezult=summcor;
}

void normalcorr(int massx[countmass], int massy[countmass], float *rezult){
	int i = 0; 
	float summcorx=0, summcory=0, summcor=0, itog=0;
        for(i=0;i<countmass;i++){
                summcorx = summcorx + (massx[i]*massx[i]);
		summcory = summcory + (massy[i]*massy[i]);
        }
	corr(massx, massy, &summcor);
	itog=(summcor/ sqrt(summcorx*summcory));
	*rezult=itog;
}


void printmass(int mass[countmass], int mas){
        int i = 0;
	printf("mass_%d = {", mas);
        for(i=0;i<countmass-1;i++){
                printf(" %3d,", mass[i]);
        }
	printf(" %3d", mass[countmass-1]);
	printf("}\n");
}

int main(){
	int i = 0;
	int masa[countmass] = {7, 2, 8, 12, -4, -4, 1, 3};
	int masb[countmass] = {3, 6, 7, 10, -5, -2, 2, 5};
	int masc[countmass] = {-5, -1, 3, -9, 2, 3, 4, -4};
	float rezultcorab = 0, rezultcorac = 0,rezultcorbc = 0;
	corr(masa,masb,&rezultcorab);
	corr(masa,masc,&rezultcorac);
	corr(masb,masc,&rezultcorbc);
	printf("\n\n");
	printmass(masa,1);
	printmass(masb,1);
	printmass(masc,1);

	printf("\n\n------------------------\nОбычная корреляция\n------------------------\n");
	printf("\\ |  A   |  B   |  C   |\n------------------------\n");
	printf("A |   -  | %4.0f | %4.0f |\n------------------------\n" , rezultcorab, rezultcorac);
	printf("B | %4.0f |   -  | %4.0f |\n------------------------\n" , rezultcorab, rezultcorbc);
	printf("C | %4.0f | %4.0f |   -  |\n------------------------\n\n\n" , rezultcorac,rezultcorbc);

	normalcorr(masa,masb,&rezultcorab);
        normalcorr(masa,masc,&rezultcorac);
        normalcorr(masb,masc,&rezultcorbc);
	
	printf("---------------------------------\nНормализованная корреляция\n---------------------------------\n");
        printf("\\ |   A     |   B     |    C    |\n---------------------------------\n");
        printf("A |    -    | %7.4f | %7.4f |\n---------------------------------\n" , rezultcorab, rezultcorac);
        printf("B | %7.4f |    -    | %7.4f |\n---------------------------------\n" , rezultcorab, rezultcorbc);
        printf("C | %7.4f | %7.4f |     -   |\n---------------------------------\n" , rezultcorac,rezultcorbc);

}
