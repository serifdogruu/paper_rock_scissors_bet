import 'dart:io';
import 'dart:math';

enum cases {Rock, Paper, Scissors }
enum game  {p_win, scoreless, p_lose}
bool check1 = true ;
int amount = 0 ; 


void main(List<String> args) {

  print("welcome rock paper scissors with bet");

  print("please type your total amount");

 do{ 
    try{
      amount = int.parse(stdin.readLineSync()!);
      check1 = false ;
    }
    catch(e){
      print("please type your amount with number");
      check1 = true ; 
    }
  }while(check1);
  
  do{
    print("please type your bet amount");
    bool check = true ;
    bool trycheck = true ;  
    int bet = 0 ; 
    do{
        try{
        bet = int.parse(stdin.readLineSync()!);
        trycheck = false ; 
              if(bet > amount){
          check = true ;
          print("you don't have enough money"); 
          print("please type your bet");
        }
        else{
          check = false ; 
        }

        }catch(e){
          print("please type your money with number");
          trycheck = true ;
        }
    }while(check || trycheck);
      
    String player_chose = player_move();
    String computer_move = comp_move();

    String who_win = game_check(player_chose, computer_move);
    amount = betcontrol(who_win,amount,bet); 


    print("money balance : $amount");
  }while(amount > 0 );
print("you are out of money");
}

String player_move(){
  print("please select your move");
  print("Move list : Rock, Paper, Scissors");
  String player = " ";
  bool check = true ;  
  
  do{
    try{
      player = stdin.readLineSync().toString().toLowerCase() ;
      if(player == "rock" || player =="paper" || player == "scissors" ){
        check = false;
      }
      else{
          print("your selection is not in the move list");
          check = true ; 
         
      }
    }
    catch(e){
      print("please type your move");
      print("Move list : Rock, Paper, Scissors");
      check = true ; 
    }
    }while(check);

  String player_move = "invalid" ;
  if(player == "rock"){
    player_move = cases.Rock.toString().split('.').last; ;
  }
  else if(player == "paper"){
    player_move = cases.Paper.toString().split('.').last; ;
  }
  else if(player == "scissors"){
    player_move = cases.Scissors.toString().split('.').last; ;
  }
  else{
    print("your chosen is wrong");
  }
  print("your move is : $player_move");
  return player_move ; 

}

String comp_move(){
  Random rand = new Random();
  int num = rand.nextInt(3); 
  String computer_move = " ";
  if(num == 0){
    computer_move = cases.Rock.toString().split('.').last;
  }
  else if(num == 1){
    computer_move = cases.Paper.toString().split('.').last;
  }
  else if(num == 2){
    computer_move = cases.Scissors.toString().split('.').last;
  }
  print("computer move is : $computer_move");
  return computer_move;
}

String game_check(String p_move , String c_move){
  String game_situation = "error" ;
  if(p_move == c_move){
    game_situation = game.scoreless.toString().split('.').last ;
  }
  //
  else if (p_move == "Rock" && c_move == "Paper"){
    game_situation = game.p_lose.toString().split('.').last ;
  }
  else if (p_move == "Rock" && c_move == "Scissors"){
    game_situation = game.p_win.toString().split('.').last ;
  }
  //
  else if (p_move == "Paper" && c_move == "Rock"){
    game_situation = game.p_win.toString().split('.').last ;
  }
  else if(p_move == "Paper" && c_move == "Scissors"){
    game_situation = game.p_lose.toString().split('.').last;
  }
  //
  else if(p_move == "Scissors" && c_move == "Paper"){
    game_situation = game.p_win.toString().split('.').last ;
  }
  else if(p_move == "Scissors" && c_move == "Rock"){
    game_situation = game.p_lose.toString().split('.').last ;
  }
  return game_situation ;

}

int betcontrol (String game_check , int amount, int bet){
    if(game_check == "p_win"){
      print("you are winner ");
      amount = amount + bet ; 
      print("you win $bet, and your money is : $amount");
    }
    else if(game_check == "p_lose"){
      print("you are loser");
      amount = amount - bet ; 
      print("you lose $bet, and your money is : $amount");
    }
    else if(game_check == "scoreless"){
      print("scoreless");
      amount = amount ; 
      print("your money is stable : $amount");
    }
    return amount ; 
}


