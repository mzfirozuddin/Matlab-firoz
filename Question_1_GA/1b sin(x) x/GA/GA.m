function [avg_fitness, max_fitness, x] = GA(No_of_Generation, Pop_Size)

pop0 = round(rand(Pop_Size, 32));

for k = 1:No_of_Generation
    
    for i = 1:Pop_Size
        
         a = randperm(Pop_Size);
         
        c1 = a(1);
        c2 = a(2);
        
        x1 = scaling(dec(pop0(c1,1:end)));        
        y1 = scaling(dec(pop0(c2,1:end)));
        
        if obj(x1) >= obj(y1)
            mat(i,:) = pop0(c1,:);
        else
            mat(i,:) = pop0(c2,:);
        end
        
    end
    
    New_Pop = [];
    
    for i = 1:floor(Pop_Size/2)
        
        a = randperm(Pop_Size);
        
        parent1 = mat(a(1),:);
        parent2 = mat(a(2),:);
        
        if rand < 0.8
            [offspring1, offspring2] = xover(parent1, parent2);        
            New_Pop = [New_Pop;offspring1;offspring2];            
        else
            New_Pop = [New_Pop;parent1;parent2];
        end
        
    end
    
    for i = 1:Pop_Size
        
        for j = 1:16
            
            if rand < 0.01                
                New_Pop(i,j) = 1 - New_Pop(i,j);
            end
            
        end
        
    end
    
    for i = 1:Pop_Size
        p(i) = scaling(dec(pop0(i,1:end)));
        fitness(i) = obj(p(i));
    end
    
    avg_fitness(k) = mean(fitness);
    max_fitness(k) = max(fitness);
    
    for i = 1:Pop_Size
        
        if fitness(i) == max_fitness
            x = p(i);
        end
        
    end
    
    pop0 = New_Pop;
    
end
