package model;

public class Appointment {

    private int id;
    private int patientId;
    private int doctorId;
    private String date;

    // 🔹 NEW fields (ONLY for VIEW purpose)
    private String patientName;
    private String doctorName;

    // ===== getters & setters =====

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getPatientId() {
        return patientId;
    }
    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorId() {
        return doctorId;
    }
    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    // ===== NEW getters & setters =====

    public String getPatientName() {
        return patientName;
    }
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getDoctorName() {
        return doctorName;
    }
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }
}



















/*package model;

public class Appointment{
    private int id, patientId, doctorId;
    private String date;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPatientId() { return patientId; }
    public void setPatientId(int patientId) { this.patientId = patientId; }

    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
}*/
