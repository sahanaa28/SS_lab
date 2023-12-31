/* Design, develop and implement a C/C++/Java program to simulate the working of Shortest remaining
time and Round Robin (RR) scheduling algorithms. Experiment with different quantum sizes for RR
algorithm. */
#include<stdio.h>
#include<stdlib.h>
void roundrobin();
void srtf();
main()
{
int choice;
for(;;)
{
int choice;
printf("Enter the choice \n");
printf(" 1. Round Robin\n 2. SRTF\n 3. Exit \n");
scanf("%d",&choice);
switch(choice)
{
case 1:
printf("\n \n ---ROUND ROBIN---\n \n ");
roundrobin();
break;
case 2:
printf("\n \n ---SHORTEST REMAINING TIME NEXT---\n \n ");
srtf();
break;
case 3: exit(0);
}
}
}
void roundrobin()
{
int n,tq,bt[10],st[10],time=0,tat[10],wt[10],i,count=0,swt=0,stat=0,temp1,sq=0,j,k;
float awt=0.0,atat=0.0;
printf("Enter number of processes:\n");
scanf("%d",&n);
printf("Enter burst time for sequences:");
for(i=0;i<n;i++)
{
scanf("%d",&bt[i]);
st[i]=bt[i];
}
printf("Enter time quantum:");
scanf("%d",&tq);
while(1)
{
for(i=0,count=0;i<n;i++)
{
temp1=tq;
if(st[i]==0) 
{
count++;
continue;
}
if(st[i]>tq)
st[i]=st[i]-tq; 
else
if(st[i]>=0)
{
temp1=st[i];
st[i]=0;
}
sq=sq+temp1;
tat[i]=sq;
} //end of for
if(n==count)
break;
} //end of while
for(i=0;i<n;i++)
{
wt[i]=tat[i]-bt[i];
swt=swt+wt[i];
stat=stat+tat[i];
}
awt=(float)swt/n;
atat=(float)stat/n;
printf("Process_no\tBurst time\t Wait time\t Turn around time\n");
for(i=0;i<n;i++)
printf("%d\t\t%d\t\t%d\t\t%d\n",i+1,bt[i],wt[i],tat[i]);
printf("Avg wait time is %f\n Avg turn around time is %f\n",awt,atat);
}// end of Round Robin

void srtf()
{
int a[10],b[10],r[10],waiting[10],turnaround[10],completion[10],i,j,smallest,count=0,time,n;
float avg=0,tt=0,end;
 printf("\nEnter the number of Processes: ");
 scanf("%d",&n);
 for(i=0;i<n;i++)
 {
   printf("\nEnter arrival time of process %d : ",i+1);
   scanf("%d",&a[i]);
 }
 for(i=0;i<n;i++)
 {
   printf("\nEnter burst time of process %d : ",i+1);
   scanf("%d",&b[i]);
 }
 for(i=0;i<n;i++)
 r[i]=b[i];
  b[9]=9999;

 for(time=0;count!=n;time++)
 {
   smallest=9;
  for(i=0;i<n;i++)
  {
   if(a[i]<=time && b[i]<b[smallest] && b[i]>0 )
   smallest=i;
  }
  b[smallest]--;
  
  if(b[smallest]==0)
  {
   count++;
   end=time+1;
   completion[smallest] = end;
   waiting[smallest] = end - a[smallest] - r[smallest];
   turnaround[smallest] = end - a[smallest];
   
  }
 }
 printf("pid \t burst \t arrival \twaiting \tturnaround \tcompletion");
 for(i=0;i<n;i++)
 {
   printf("\n %d \t   %d \t %d\t\t%d   \t\t%d\t\t%d",i+1,r[i],a[i],waiting[i],turnaround[i],completion[i]);
   avg = avg + waiting[i];
   tt = tt + turnaround[i];
 }
  printf("\n\nAverage waiting time = %f\n",avg/n);
 printf("Average Turnaround time = %f\n",tt/n);
}
