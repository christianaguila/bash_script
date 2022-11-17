#!/usr/bin/bash

#Functions for simple interest equations
ft_amnt_smpl(){
	echo "How much is the principal?"
	read p
	echo "What is the interest rate(%)?"
	read i
	echo "How many years?"
	read n
	ft_amnt=$(awk "BEGIN {print $p*(1+($i/100)*$n)}")
	echo "Future Amount: $ft_amnt"
}

pr_amnt_smpl(){
	echo "How much is the future amount?"
	read f
	echo "What is the interest rate(%)?"
	read i
	echo "How many years?"
	read n
	pr_amnt=$(awk "BEGIN {print $f*(1+($i/100)*$n)**-1}")
	echo "Principal Amount: $pr_amnt"
}


int_rt_smpl(){
	echo "How much is the future amount?"
	read f
	echo "How much is the principal amount?"
	read p
	echo "How many years?"
	read n
	int_rt=$(awk "BEGIN {print (($f/($p*$n))-(1/$n))*100}")
	echo "Interest Rate: $int_rt%"
}


yr_smpl(){
	echo "How much is the future amount?"
	read f
	echo "How much is the principal amount?"
	read p
	echo  "What is the interest rate(%)?"
	read i
	yr=$(awk "BEGIN {print (($f*100)/($p*$i))-(100/$i)}")
	echo "Number of Years: $yr"
}



#Compound Interest equations
ft_amnt_cmpd(){
        echo "How much is the principal?"
        read p
        echo "What is the interest rate(%)?"
        read i
        echo "How many years?"
        read n
	echo "What is the method of compounding?
	a. Annually
	b. Semi-Annually
	c. Quarterly
	d. Monthly"
	echo "Enter the letter: "
	read ans

	case $ans in
		a) m=1
		ft_amnt=$(awk "BEGIN {print $p*(1+($i/($m*100)))**($n*$m)}")
        	echo "Future Amount: $ft_amnt";;
		b) m=2
		ft_amnt=$(awk "BEGIN {print $p*(1+($i/($m*100)))**($n*$m)}")
        	echo "Future Amount: $ft_amnt";;
		c) m=4
		ft_amnt=$(awk "BEGIN {print $p*(1+($i/($m*100)))**($n*$m)}")
        	echo "Future Amount: $ft_amnt";;
		d) m=12
		ft_amnt=$(awk "BEGIN {print $p*(1+($i/($m*100)))**($n*$m)}")
        	echo "Future Amount: $ft_amnt";;

	esac
}


pr_amnt_cmpd(){
        echo "How much is the future amount?"
        read f
        echo "What is the interest rate(%)?"
        read i
        echo "How many years?"
        read n
        echo "What is the method of compounding?
        a. Annually
        b. Semi-Annually
        c. Quarterly
        d. Monthly"
        echo "Enter the letter: "
        read ans

        case $ans in
                a) m=1
		pr_amnt=$(awk "BEGIN {print $f*(1+($i/($m*100)))**(-$n*$m)}")
        	echo "Principal Amount: $pr_amnt";;
                b) m=2
		pr_amnt=$(awk "BEGIN {print $f*(1+($i/($m*100)))**(-$n*$m)}")
	        echo "Principal Amount: $pr_amnt";;
                c) m=4
		pr_amnt=$(awk "BEGIN {print $f*(1+($i/($m*100)))**(-$n*$m)}")
	        echo "Principal Amount: $pr_amnt";;
                d) m=12
		pr_amnt=$(awk "BEGIN {print $f*(1+($i/($m*100)))**(-$n*$m)}")
	        echo "Principal Amount: $pr_amnt";;
        esac
}


int_rt_cmpd(){
        echo "How much is the future amount?"
        read f
        echo "What is the principal amount"
        read p
        echo "How many years?"
        read n
        echo "What is the method of compounding?
        a. Annually
        b. Semi-Annually
        c. Quarterly
        d. Monthly"
        echo "Enter the letter: "
        read ans

        case $ans in
                a) m=1
		int_rt=$(awk "BEGIN {print ($m*100*(($f/$p)**(1/($m*$n))-1))}")
	        echo "Interest Rate: $int_rt%";;
                b) m=2
		int_rt=$(awk "BEGIN {print ($m*100*(($f/$p)**(1/($m*$n))-1))}")
	        echo "Interest Rate: $int_rt%";;
                c) m=4
		int_rt=$(awk "BEGIN {print ($m*100*(($f/$p)**(1/($m*$n))-1))}")
	        echo "Interest Rate: $int_rt%";;
                d) m=12
		int_rt=$(awk "BEGIN {print ($m*100*(($f/$p)**(1/($m*$n))-1))}")
	        echo "Interest Rate: $int_rt%";;
	esac
}



echo "What are you trying to solve?
a. Simple Interest
b. Compound Interest
Enter the letter: "
read ans

if [[ $ans == "a" ]]; then
	echo "What do you want to know?
	a. Future Amount
	b. Principal/Present Amount
	c. Interest Rate
	d. Years"
	read ch

	case $ch in
		a) ft_amnt_smpl;;
		b) pr_amnt_smpl;;
		c) int_rt_smpl;;
		d) yr_smpl;;
	esac
else
	echo "What do you want to know?
	a. Future Amount
	b. Principal/Present Amount
	c. Interest Rate
	d. Years"
	read ch

	case $ch in
		a) ft_amnt_cmpd;;
		b) pr_amnt_cmpd;;
		c) int_rt_cmpd;;
	esac
fi

