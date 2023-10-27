package features.Authentication.test.java.com.authTs;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.stream.Collectors;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertTrue;


@KarateOptions(features = {
        "classpath:authTs/tests/LoginAuth.feature",
})

public class Reporting {

    @Test
    public void reporting() {
        System.setProperty("karate.env", "staging");
        Results results = Runner.parallel(getClass(), 5);
        generateReport(results.getReportDir());
    }

    public void generateReport(String karateOutputPath) {
        List<String> jsonPaths = findJsonFiles(karateOutputPath);
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

        // Assert no failures
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    private void assertTrue(String errorMessages, boolean condition) {
        if (!condition) {
            throw new AssertionError(errorMessages);
        }
    }

    private List<String> findJsonFiles(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        return jsonFiles.stream()
                .map(File::getAbsolutePath)
                .collect(Collectors.toList());
    }

}