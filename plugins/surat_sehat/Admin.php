<?php
namespace Plugins\Surat_Sehat;

use Systems\AdminModule;

class Admin extends AdminModule
{

    public function navigation()
    {
        return [
            'Kelola'   => 'manage',
        ];
    }

    public function getManage(){
        $this->_addHeaderFiles();
        return $this->draw('manage.html');
    }

    public function postData(){
        $draw = $_POST['draw'];
        $row1 = $_POST['start'];
        $rowperpage = $_POST['length']; // Rows display per page
        $columnIndex = $_POST['order'][0]['column']; // Column index
        $columnName = $_POST['columns'][$columnIndex]['data']; // Column name
        $columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
        $searchValue = $_POST['search']['value']; // Search value

        ## Custom Field value
        $search_field_mlite_surat_sehat= $_POST['search_field_mlite_surat_sehat'];
        $search_text_mlite_surat_sehat = $_POST['search_text_mlite_surat_sehat'];

        $searchQuery = " ";
        if($search_text_mlite_surat_sehat != ''){
            $searchQuery .= " and (".$search_field_mlite_surat_sehat." like '%".$search_text_mlite_surat_sehat."%' ) ";
        }

        ## Total number of records without filtering
        $sel = $this->db()->pdo()->prepare("select count(*) as allcount from mlite_surat_sehat");
        $sel->execute();
        $records = $sel->fetch();
        $totalRecords = $records['allcount'];

        ## Total number of records with filtering
        $sel = $this->db()->pdo()->prepare("select count(*) as allcount from mlite_surat_sehat WHERE 1 ".$searchQuery);
        $sel->execute();
        $records = $sel->fetch();
        $totalRecordwithFilter = $records['allcount'];

        ## Fetch records
        $sel = $this->db()->pdo()->prepare("select * from mlite_surat_sehat WHERE 1 ".$searchQuery." order by ".$columnName." ".$columnSortOrder." limit ".$row1.",".$rowperpage);
        $sel->execute();
        $result = $sel->fetchAll(\PDO::FETCH_ASSOC);

        $data = array();
        foreach($result as $row) {
            $data[] = array(
                'id'=>$row['id'],
'nomor_surat'=>$row['nomor_surat'],
'no_rawat'=>$row['no_rawat'],
'no_rkm_medis'=>$row['no_rkm_medis'],
'nm_pasien'=>$row['nm_pasien'],
'tgl_lahir'=>$row['tgl_lahir'],
'umur'=>$row['umur'],
'jk'=>$row['jk'],
'alamat'=>$row['alamat'],
'tanggal'=>$row['tanggal'],
'berat_badan'=>$row['berat_badan'],
'tinggi_badan'=>$row['tinggi_badan'],
'tensi'=>$row['tensi'],
'gol_darah'=>$row['gol_darah'],
'riwayat_penyakit'=>$row['riwayat_penyakit'],
'keperluan'=>$row['keperluan'],
'dokter'=>$row['dokter'],
'petugas'=>$row['petugas']

            );
        }

        ## Response
        $response = array(
            "draw" => intval($draw), 
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalRecordwithFilter,
            "aaData" => $data
        );

        echo json_encode($response);
        exit();
    }

    public function postAksi()
    {
        if(isset($_POST['typeact'])){ 
            $act = $_POST['typeact']; 
        }else{ 
            $act = ''; 
        }

        if ($act=='add') {

        $id = $_POST['id'];
$nomor_surat = $_POST['nomor_surat'];
$no_rawat = $_POST['no_rawat'];
$no_rkm_medis = $_POST['no_rkm_medis'];
$nm_pasien = $_POST['nm_pasien'];
$tgl_lahir = $_POST['tgl_lahir'];
$umur = $_POST['umur'];
$jk = $_POST['jk'];
$alamat = $_POST['alamat'];
$tanggal = $_POST['tanggal'];
$berat_badan = $_POST['berat_badan'];
$tinggi_badan = $_POST['tinggi_badan'];
$tensi = $_POST['tensi'];
$gol_darah = $_POST['gol_darah'];
$riwayat_penyakit = $_POST['riwayat_penyakit'];
$keperluan = $_POST['keperluan'];
$dokter = $_POST['dokter'];
$petugas = $_POST['petugas'];

            
            $mlite_surat_sehat_add = $this->db()->pdo()->prepare('INSERT INTO mlite_surat_sehat VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
            $mlite_surat_sehat_add->execute([$id, $nomor_surat, $no_rawat, $no_rkm_medis, $nm_pasien, $tgl_lahir, $umur, $jk, $alamat, $tanggal, $berat_badan, $tinggi_badan, $tensi, $gol_darah, $riwayat_penyakit, $keperluan, $dokter, $petugas]);

        }
        if ($act=="edit") {

        $id = $_POST['id'];
$nomor_surat = $_POST['nomor_surat'];
$no_rawat = $_POST['no_rawat'];
$no_rkm_medis = $_POST['no_rkm_medis'];
$nm_pasien = $_POST['nm_pasien'];
$tgl_lahir = $_POST['tgl_lahir'];
$umur = $_POST['umur'];
$jk = $_POST['jk'];
$alamat = $_POST['alamat'];
$tanggal = $_POST['tanggal'];
$berat_badan = $_POST['berat_badan'];
$tinggi_badan = $_POST['tinggi_badan'];
$tensi = $_POST['tensi'];
$gol_darah = $_POST['gol_darah'];
$riwayat_penyakit = $_POST['riwayat_penyakit'];
$keperluan = $_POST['keperluan'];
$dokter = $_POST['dokter'];
$petugas = $_POST['petugas'];


        // BUANG FIELD PERTAMA

            $mlite_surat_sehat_edit = $this->db()->pdo()->prepare("UPDATE mlite_surat_sehat SET id=?, nomor_surat=?, no_rawat=?, no_rkm_medis=?, nm_pasien=?, tgl_lahir=?, umur=?, jk=?, alamat=?, tanggal=?, berat_badan=?, tinggi_badan=?, tensi=?, gol_darah=?, riwayat_penyakit=?, keperluan=?, dokter=?, petugas=? WHERE id=?");
            $mlite_surat_sehat_edit->execute([$id, $nomor_surat, $no_rawat, $no_rkm_medis, $nm_pasien, $tgl_lahir, $umur, $jk, $alamat, $tanggal, $berat_badan, $tinggi_badan, $tensi, $gol_darah, $riwayat_penyakit, $keperluan, $dokter, $petugas,$id]);
        
        }

        if ($act=="del") {
            $id= $_POST['id'];
            $check_db = $this->db()->pdo()->prepare("DELETE FROM mlite_surat_sehat WHERE id='$id'");
            $result = $check_db->execute();
            $error = $check_db->errorInfo();
            if (!empty($result)){
              $data = array(
                'status' => 'success', 
                'msg' => $no_rkm_medis
              );
            } else {
              $data = array(
                'status' => 'error', 
                'msg' => $error['2']
              );
            }
            echo json_encode($data);                    
        }

        if ($act=="lihat") {

            $search_field_mlite_surat_sehat= $_POST['search_field_mlite_surat_sehat'];
            $search_text_mlite_surat_sehat = $_POST['search_text_mlite_surat_sehat'];

            $searchQuery = " ";
            if($search_text_mlite_surat_sehat != ''){
                $searchQuery .= " and (".$search_field_mlite_surat_sehat." like '%".$search_text_mlite_surat_sehat."%' ) ";
            }

            $user_lihat = $this->db()->pdo()->prepare("SELECT * from mlite_surat_sehat WHERE 1 ".$searchQuery);
            $user_lihat->execute();
            $result = $user_lihat->fetchAll(\PDO::FETCH_ASSOC);

            $data = array();

            foreach($result as $row) {
                $data[] = array(
                    'id'=>$row['id'],
'nomor_surat'=>$row['nomor_surat'],
'no_rawat'=>$row['no_rawat'],
'no_rkm_medis'=>$row['no_rkm_medis'],
'nm_pasien'=>$row['nm_pasien'],
'tgl_lahir'=>$row['tgl_lahir'],
'umur'=>$row['umur'],
'jk'=>$row['jk'],
'alamat'=>$row['alamat'],
'tanggal'=>$row['tanggal'],
'berat_badan'=>$row['berat_badan'],
'tinggi_badan'=>$row['tinggi_badan'],
'tensi'=>$row['tensi'],
'gol_darah'=>$row['gol_darah'],
'riwayat_penyakit'=>$row['riwayat_penyakit'],
'keperluan'=>$row['keperluan'],
'dokter'=>$row['dokter'],
'petugas'=>$row['petugas']
                );
            }

            echo json_encode($data);
        }
        exit();
    }

    public function getDetail($id)
    {
        $detail = $this->db('mlite_surat_sehat')->where('id', $id)->toArray();
        echo $this->draw('detail.html', ['detail' => $detail]);
        exit();
    }

    public function getSuratSehat($no_rawat)
    {
        $kd_dokter = $this->core->getRegPeriksaInfo('kd_dokter', revertNoRawat($no_rawat));
        $no_rkm_medis = $this->core->getRegPeriksaInfo('no_rkm_medis', revertNoRawat($no_rawat));
        $pasien = $this->db('pasien')
          ->join('kelurahan', 'kelurahan.kd_kel=pasien.kd_kel')
          ->join('kecamatan', 'kecamatan.kd_kec=pasien.kd_kec')
          ->join('kabupaten', 'kabupaten.kd_kab=pasien.kd_kab')
          ->join('propinsi', 'propinsi.kd_prop=pasien.kd_prop')
          ->where('no_rkm_medis', $no_rkm_medis)
          ->oneArray();
        $nm_dokter = $this->core->getPegawaiInfo('nama', $kd_dokter);
        $sip_dokter = $this->core->getDokterInfo('no_ijn_praktek', $kd_dokter);
        $this->tpl->set('pasien', $this->tpl->noParse_array(htmlspecialchars_array($pasien)));
        $this->tpl->set('nm_dokter', $nm_dokter);
        $this->tpl->set('sip_dokter', $sip_dokter);
        $this->tpl->set('no_rawat', revertNoRawat($no_rawat));
        $this->tpl->set('settings', $this->tpl->noParse_array(htmlspecialchars_array($this->settings('settings'))));
        $this->tpl->set('surat', $this->db('mlite_surat_sehat')->where('no_rawat', revertNoRawat($no_rawat))->oneArray());
        echo $this->tpl->draw(MODULES.'/surat_sehat/view/admin/surat.sehat.html', true);
        exit();
    }

    public function getCss()
    {
        header('Content-type: text/css');
        echo $this->draw(MODULES.'/surat_sehat/css/admin/styles.css');
        exit();
    }

    public function getJavascript()
    {
        header('Content-type: text/javascript');
        $settings = $this->settings('settings');
        echo $this->draw(MODULES.'/surat_sehat/js/admin/scripts.js', ['settings' => $settings]);
        exit();
    }

    private function _addHeaderFiles()
    {
        $this->core->addCSS(url('assets/css/datatables.min.css'));
        $this->core->addJS(url('assets/jscripts/jqueryvalidation.js'));
        $this->core->addJS(url('assets/jscripts/xlsx.js'));
        $this->core->addJS(url('assets/jscripts/jspdf.min.js'));
        $this->core->addJS(url('assets/jscripts/jspdf.plugin.autotable.min.js'));
        $this->core->addJS(url('assets/jscripts/datatables.min.js'));

        $this->core->addCSS(url([ADMIN, 'surat_sehat', 'css']));
        $this->core->addJS(url([ADMIN, 'surat_sehat', 'javascript']), 'footer');
    }

}