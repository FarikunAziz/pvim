return {
  s({
    trig = "scout",
    name = "std::cout",
    dscr = "ouput to screen",
  },{
      t "std::cout<<",
      i(1,""),
      i(0,";"),
    }),


  s({
    trig = "scin",
    name = "std::cin",
    dscr = "input from user",
  },{
      t "std::cin>>",
      i(1,""),
      i(0,";"),
    })
}
