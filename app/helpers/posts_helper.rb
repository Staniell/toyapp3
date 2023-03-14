module PostsHelper
    def standard_datetime(datetime)
        datetime.in_time_zone("Asia/Shanghai").strftime("%B %d, %Y %I:%M %p")
    end    
end
