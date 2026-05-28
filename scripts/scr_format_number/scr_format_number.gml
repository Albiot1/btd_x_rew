function scr_format_number(_number){
    if _number < 1_000{
        return $"{_number}"
    }
    else if _number >= 1_000 and _number < 1_000_000{
        return $"{_number/1_000}K"
    }
    else if _number >= 1_000_000 and _number < 1_000_000_000{
        return $"{_number/1_000_000}M"
    }
    else if _number >= 1_000_000_000{
        return $"{_number/1_000_000_000}B"
    }
}