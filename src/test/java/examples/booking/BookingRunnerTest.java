package examples.booking;

import com.intuit.karate.junit5.Karate;

class BookingRunnerTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
