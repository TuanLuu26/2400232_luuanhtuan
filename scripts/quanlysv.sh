#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATA_FILE="$BASE_DIR/data/sinhvien.txt"

if [ ! -f "$DATA_FILE" ]; then
    echo "Loi: Khong tim thay file du lieu tai $DATA_FILE"
    exit 1
fi

hien_thi_ds() {
    echo ""
    echo "--- DANH SACH SINH VIEN ---"
    awk -F',' '{printf "%-8s | %-20s | %.1f\n", $1, $2, $3}' "$DATA_FILE"
}

tim_kiem_sv() {
    read -r -p "Nhap ma sinh vien can tim: " ma_sv
    ket_qua=$(grep -i "^${ma_sv}," "$DATA_FILE")
    if [ -n "$ket_qua" ]; then
        echo "Tim thay sinh vien:"
        echo "$ket_qua" | awk -F',' '{printf "Ma: %s | Ho ten: %s | Diem: %.1f\n", $1, $2, $3}'
    else
        echo "Khong tim thay sinh vien co ma '$ma_sv'."
    fi
}

thong_ke_dat() {
    awk -F',' '
    BEGIN { dat = 0; khong_dat = 0 }
    {
        if ($3 >= 5) dat++;
        else khong_dat++;
    }
    END {
        print "So sinh vien dat (>= 5)    :", dat
        print "So sinh vien khong dat (< 5):", khong_dat
    }' "$DATA_FILE"
}

tinh_trung_binh() {
    awk -F',' '
    BEGIN { tong = 0; dem = 0 }
    {
        tong += $3;
        dem++;
    }
    END {
        if (dem > 0)
            printf "Diem trung binh cua lop: %.2f\n", tong / dem;
        else
            print "Khong co du lieu de tinh diem trung binh.";
    }' "$DATA_FILE"
}

diem_cao_nhat() {
    echo "--- SINH VIEN CO DIEM CAO NHAT ---"
    awk -F',' '
    NR == 1 { max = $3 }
    $3 > max { max = $3 }
    { diem[NR] = $3; dong[NR] = $0 }
    END {
        for (i = 1; i <= NR; i++) {
            if (diem[i] == max) {
                split(dong[i], p, ",");
                printf "Ma: %s | Ho ten: %s | Diem: %.1f\n", p[1], p[2], p[3];
            }
        }
    }' "$DATA_FILE"
}

sap_xep_giam_dan() {
    echo "--- DANH SACH SAP XEP THEO DIEM GIAM DAN ---"
    sort -t',' -k3,3nr "$DATA_FILE" | awk -F',' '{printf "%-8s | %-20s | %.1f\n", $1, $2, $3}'
}

while true; do
    echo ""
    echo "===== CHUONG TRINH QUAN LY SINH VIEN ====="
    echo "1. Hien thi danh sach sinh vien"
    echo "2. Tim kiem sinh vien theo ma"
    echo "3. Thong ke sinh vien dat va khong dat"
    echo "4. Tinh diem trung binh"
    echo "5. Hien thi sinh vien co diem cao nhat"
    echo "6. Sap xep sinh vien theo diem giam dan"
    echo "0. Thoat chuong trinh"
    read -r -p "Nhap lua chon: " lua_chon

    case "$lua_chon" in
        1) hien_thi_ds ;;
        2) tim_kiem_sv ;;
        3) thong_ke_dat ;;
        4) tinh_trung_binh ;;
        5) diem_cao_nhat ;;
        6) sap_xep_giam_dan ;;
        0)
            echo "Thoat chuong trinh. Tam biet!"
            exit 0
            ;;
        *)
            echo "Lua chon khong hop le! Vui long chon tu 0 den 6."
            ;;
    esac
done
