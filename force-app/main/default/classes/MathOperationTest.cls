@isTest
public class MathOperationTest {
    static testmethod void TestMathOperation(){
        test.startTest();
        //Invoke Class
        MathOperation.addMethod(65,89,61);
        
        MathOperation.subMethod(65,39);
        
        MathOperation.mulMethod(20,34);
        
        MathOperation.divMethod(543,12);
        
        system.assertNotEquals(500, MathOperation.multiplyMethod(20,20));
        test.stopTest();
    }
}