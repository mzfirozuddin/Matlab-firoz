function [avg_fitness, max_fitness, a, b, c, d] = GA(No_of_Generation, Pop_Size)

pop0 = round(rand(Pop_Size, 64));

for k = 1:No_of_Generation
    
    for i = 1:Pop_Size
        
        rp = randperm(Pop_Size);
         
        c1 = rp(1);
        c2 = rp(2);
        
        x1 = scaling(dec(pop0(c1,1:16)));
        x2 = scaling(dec(pop0(c1,17:32)));
        x3 = scaling(dec(pop0(c1,33:48)));
        x4 = scaling(dec(pop0(c1,49:end)));
        
        y1 = scaling(dec(pop0(c2,1:16)));
        y2 = scaling(dec(pop0(c2,17:32)));
        y3 = scaling(dec(pop0(c2,33:48)));
        y4 = scaling(dec(pop0(c2,49:end)));
        
        if obj(x1,x2,x3,x4) >= obj(y1,y2,y3,y4)
            mat(i,:) = pop0(c1,:);
        else
            mat(i,:) = pop0(c2,:);
        end
        
    end
    
    New_Pop = [];
    
    for i = 1:floor(Pop_Size/2)
        
        rp = randperm(Pop_Size);
        
        parent1 = mat(rp(1),:);
        parent2 = mat(rp(2),:);
        
        if rand < 0.8
            [offspring1, offspring2] = xover(parent1, parent2);        
            New_Pop = [New_Pop;offspring1;offspring2];            
        else
            New_Pop = [New_Pop;parent1;parent2];
        end
        
    end
    
    for i = 1:Pop_Size
        
        for j = 1:32
            
            if rand < 0.01                
                New_Pop(i,j) = 1 - New_Pop(i,j);
            end
            
        end
        
    end
    
    for i = 1:Pop_Size
        p(i) = scaling(dec(pop0(i,1:16)));
        q(i) = scaling(dec(pop0(i,7:32)));
        r(i) = scaling(dec(pop0(i,33:48)));
        s(i) = scaling(dec(pop0(i,49:64)));
        fitness(i) = obj(p(i),q(i),r(i),s(i));
    end
    
    avg_fitness(k) = mean(fitness);
    max_fitness(k) = max(fitness);
    
    for i = 1:Pop_Size
        
        if fitness(i) == max_fitness
            a = p(i);
            b = q(i);
            c = r(i);
            d = s(i);
        end
        
    end
    
    pop0 = New_Pop;
    
end
