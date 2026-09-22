package com.udanchoo.intranet.controller;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.repository.ClientRepository;
import com.udanchoo.intranet.service.ClientServiceImpl;

public class ClientContactListTest {

    @Test
    public void testSimulateSearchResultFormattingAndFiltering() {
        ClientController controller = new ClientController();
        ClientServiceImpl mockClientService = Mockito.mock(ClientServiceImpl.class);

        // Inject mockClientService via reflection or setter
        try {
            java.lang.reflect.Field field = ClientController.class.getDeclaredField("clientService");
            field.setAccessible(true);
            field.set(controller, mockClientService);
        } catch (Exception e) {
            fail("Failed to inject mockClientService: " + e.getMessage());
        }

        List<UdnClientEntity> clients = new ArrayList<>();

        UdnClientEntity c1 = new UdnClientEntity();
        c1.setClientId(1L);
        c1.setClientName("Rahul Sharma");
        c1.setMobile(9811008479L);
        clients.add(c1);

        UdnClientEntity c2 = new UdnClientEntity();
        c2.setClientId(2L);
        c2.setClientName("Rahul Sharma");
        c2.setMobile(9822334455L);
        clients.add(c2);

        UdnClientEntity c3 = new UdnClientEntity();
        c3.setClientId(3L);
        c3.setClientName("Amit Singh");
        c3.setMobile(0L);
        clients.add(c3);

        Mockito.when(mockClientService.findAllClients()).thenReturn(clients);

        // Search by common name "Rahul"
        List<Tag> rahulResults = controller.getTags("Rahul");
        assertEquals(2, rahulResults.size());
        assertEquals("Rahul Sharma -- 9811008479", rahulResults.get(0).getTagName());
        assertEquals(1L, rahulResults.get(0).getId());
        assertEquals("Rahul Sharma -- 9822334455", rahulResults.get(1).getTagName());
        assertEquals(2L, rahulResults.get(1).getId());

        // Search by mobile digits "8479"
        List<Tag> mobileResults = controller.getTags("8479");
        assertEquals(1, mobileResults.size());
        assertEquals(1L, mobileResults.get(0).getId());
        assertEquals("Rahul Sharma -- 9811008479", mobileResults.get(0).getTagName());

        // Search for client without mobile
        List<Tag> amitResults = controller.getTags("Amit");
        assertEquals(1, amitResults.size());
        assertEquals("Amit Singh", amitResults.get(0).getTagName());
    }

    @Test
    public void testExistsByClientIdAndClientNameWithSuffix() {
        ClientServiceImpl clientService = new ClientServiceImpl();
        ClientRepository mockRepository = Mockito.mock(ClientRepository.class);

        try {
            java.lang.reflect.Field field = ClientServiceImpl.class.getDeclaredField("clientRepository");
            field.setAccessible(true);
            field.set(clientService, mockRepository);
        } catch (Exception e) {
            fail("Failed to inject mockRepository: " + e.getMessage());
        }

        // Case 1: Display name with "-- <mobile>"
        Mockito.when(mockRepository.existsByclientIdAndClientName(1L, "Rahul Sharma")).thenReturn(true);
        boolean result1 = clientService.existsByClientIdAndClientName(1L, "Rahul Sharma -- 9811008479");
        assertTrue(result1);

        // Case 2: Clean client name without suffix
        boolean result2 = clientService.existsByClientIdAndClientName(1L, "Rahul Sharma");
        assertTrue(result2);

        // Case 3: Fallback check with findById when exact whitespace doesn't match
        Mockito.when(mockRepository.existsByclientIdAndClientName(4L, "Manish Singh")).thenReturn(false);
        UdnClientEntity clientWithTrailingSpace = new UdnClientEntity();
        clientWithTrailingSpace.setClientId(4L);
        clientWithTrailingSpace.setClientName("Manish Singh ");
        Mockito.when(mockRepository.findById(4L)).thenReturn(java.util.Optional.of(clientWithTrailingSpace));

        boolean result3 = clientService.existsByClientIdAndClientName(4L, "Manish Singh -- 9792807915");
        assertTrue(result3);

        // Case 4: Mismatched client name
        boolean result4 = clientService.existsByClientIdAndClientName(4L, "Different Person -- 9792807915");
        assertFalse(result4);
    }

    public static void main(String[] args) {
        System.out.println("Running ClientContactListTest...");
        ClientContactListTest test = new ClientContactListTest();
        test.testSimulateSearchResultFormattingAndFiltering();
        System.out.println("PASS: testSimulateSearchResultFormattingAndFiltering");
        test.testExistsByClientIdAndClientNameWithSuffix();
        System.out.println("PASS: testExistsByClientIdAndClientNameWithSuffix");
        System.out.println("ALL TESTS PASSED SUCCESSFULLY!");
    }
}
