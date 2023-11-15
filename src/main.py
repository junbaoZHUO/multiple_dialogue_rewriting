from rewrite import rewrite_function_cn as re_cn , rewrite_function_en as re_en


if __name__ == '__main__':
    input = "gary oldman		mainstream success ( 1991 - 2001 )		what garnered his success ?"
    output = re_en(input)
    print(output)