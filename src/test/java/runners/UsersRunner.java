package runners;

import com.intuit.karate.junit5.Karate;

class UsersRunner {

    @Karate.Test
    Karate runUsers() {
        return Karate.run("classpath:features/negatives").relativeTo(getClass());
    }
}
