package org.collectionspace.qa.cucumber.supplementary_to_secondary;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        format = { "json:target/report.json" },
        tags = { "@supplementarysecondary" }
)
public class SupplementarySecondaryIT {
}
