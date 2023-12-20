/**
 * hall of fame에 연결됨
 * 멋있는 카드효과를 구현하기 위해서 만들어짐
 */

 document.addEventListener('DOMContentLoaded', function(){
     
        const container = document.querySelector('.container');
        container.addEventListener('mousemove', function(e) {
        let x = e.offsetX;
        let y = e.offsetY;
        let rotateY = -1/5 * x + 20;
        let rotateX = 4/30 * y - 20;
        container.style = `transform :
        perspective(350px) 
        rotateY(${rotateY}deg)
        rotateX(${rotateX}deg)`
        
        container.addEventListener('mouseout', function() {
            container.style = 'transition-duration: 1.5s'
        })
    })
 })