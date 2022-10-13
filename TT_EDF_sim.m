function [schedule_table,WCRT,result] = TT_EDF_sim(tt,t_poll)
task = [tt;t_poll];
%% Initial
period = task(:2);
duration = task(:1);
deadline = task(:5);
computation = duration;
deadline_real = deadline;
t= 0;
WCRT = zeros(1,size(task,1));
r = zeros(1,size(task,1));
result = [];
%% least common multiple
T = period(1);
for i = 2:length(period)
    T = lcm(T,period(i));
end
schedule_table = zeros(T,2);
schedule_table(:,1) = 1:T;

while (t<T)
    for i = 1:size(task,1)
        if computation(i)>0 && deadline_real(i)<=t    
            result = "Deadline miss!";
            disp(result)
            return
        end
        if duration(i) == 0 && deadline_real(i)>=t 
            if t- r(i)>= WCRT(i)
                WCRT(i) = t- r(i);
            end
        end
        if mod(t,period(i)) == 0
            r(i) = t;
            computation(i) = duration(i);
            deadline_real(i) = deadline(i) + t;
        end
    end
    if sum(computation) == 0   %111
        schedule_table(t,2) = "idle";
    else
        j = EDF(t,deadline_real,computation);
        schedule_table(t,2) = j;
        computation(j) = computation(j)-1;
    end
    t = t + 1;
end
if sum(computation)>0
    result = "Schedule is infeasible!";
    return 
end 
return