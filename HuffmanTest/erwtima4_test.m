alphabet = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','space' } ;
prob = [0.0698,0.0128,0.023,0.0364,0.1086,0.0190,0.0172,0.0521,0.0595,0.0013,0.0066,0.0344,0.0206,0.0577,0.0642,0.0165,0.0008,0.0512,0.0541,0.0774,0.0236,0.0084,0.0202,0.0013,0.0169,0.0006,0.1453];

fid=fopen("cvxopt.txt",'r');
txt=fscanf(fid,"%s");
n=1;
enco="";
newfile={};
for j=1
    for i=1:2:size(txt,2) 
       newfile{n} =txt(i:min(i+1,size(txt,2)));
       n=n+1;
    end
end 

%A=cell2mat(newfile(i)); //vriskei kathe 
y=0;
saveprob = [];
for j=1:length(newfile)
    A=cell2mat(newfile(j));
        for i=1:length(A) %length=2 stoixeia se kathe cell
           y=y+ sadd(A(i),alphabet,prob);
        end 
       newprob(j)=y;
       y=0;
      
end 
    saveprob = [saveprob newprob ] ;
    
    dict =Huffmandictionary(newfile,saveprob);
    
    
    
    %-----------------------------------------%
    meso_mikos_kwdika=eff_calc(dict,saveprob);
    disp(meso_mikos_kwdika)
