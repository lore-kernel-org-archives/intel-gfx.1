Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64441CA600C
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2026 11:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF39410E7C5;
	Thu,  8 Oct 2026 11:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="iivep6OC";
	dkim-atps=neutral
Received: from sonic313-20.consmr.mail.ir2.yahoo.com
 (sonic313-20.consmr.mail.ir2.yahoo.com [77.238.179.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D6210E7E2
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Oct 2026 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791459830; bh=xgUYUaSLqkKGmhXYpMx6atQsUc58x2hMp8iMEN0fc2Y=;
 h=Date:From:To:References:Subject:From:Subject:Reply-To;
 b=iivep6OCo/T1+I9cbNoWXVbyTAdbSv9HMVKFjrde/SmcF83RSv2tXbKg6jYKvylWXRmrQx/sl6d5hnT8VJeheu/iwLiT0DR+fSvVtASSliZ1I8uBUPvi9oG4FKUdB5TF/oCjOFBGoQvX9HJA2o0Q7/hrlMKhqIKv7ms3OH9kzJHpxABMJryz46ev4gwlJdXFHIvkL+ZhMxoqB6ibR71Rcc714JQXXjKbCJlw1QeqnNTPzYQoTLwEhTeMcrgQc2dWJJXAhp/aqdJtPn6R2MSBEwMImvxOklD0TZckPyfJMsgzdCGezzDE5rD0q5AYvC7T4i6CvN/2H+Q5IltyPggNCw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791459830; bh=a0Dhfa84qaxJ5JBwNhbLsXkQkyGjXR6RWIj2PVD8w+X=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=KJ0W6WPxOJ+VukLuyM9IRy+GVQM8v8rGZ0XRShXR9EObzSxBijGzCU65VkClpmejN2G9WUUe9TwsysrxzKW9sjNolcMLeyW40tpW7kNnmGHmvthR+XAZ+zjPghZHGxrdHiIOOvRclpiUSOLN4ocuNt0hjno+0TMQqbi3knO9yoOFbCLRHt+hscTCsW38g/tZViwdSXC8U/ln13qFnGAKCYGbIUhy5V3UaOBmz6X2Z2zJkj+/HS2hACIu5XosHOc3YO3R32WTO7NfCZM3m+/NrS1fHEcFZbOHyVX1g9OiHkihyMBqsfr0w+AfWqBmiNj6gTSsv2XtcEaM5AQsU1u2Tg==
X-YMail-OSG: eC5yZgoVM1lZicxVri_VW_Nm_bG6U6ChS0X87PomiKzzDT7QgEPtbPLSIfmISY1
 UCl_Cu53nH03izfBmQX8gv6vMqXaDupeob9xFa_f0A7lbCUpqS7pedi9dBpmUkQm.VA23nw_BMO6
 2PW_I7eKhTnGNkApyGWYwlAVG8yAeGSOyJ11X9ldtiEvVoosS3hsYVGwcQaKSmFZspY0s0p_d0ob
 dpGfn43pheIbrRehNGjpVY1NldD15PMzzWti72nFoMnKPlxo2e8tZphXFo1rc7Z_gE5Szn2Z.0Mp
 zqM9N2.UN3NXzhdKv8gIsbpH0um05SDwMDuI4wQ.UeTIB6TEvZ74Q21bPq80_g9Gh_X1lMV6Mnq7
 9dezlEhIK7_NX7yWc4h6Sl4HM58Wqozc.zjWWFLZjZLx49AOBELNXsa0Rh4M2r7tVtiJ8fkw8c56
 BUSzmoGVVIRMnysB3x6AS0vXDdELxbbCayTkA9VxhP.Cf9DslFRCwfhXG_L0m1FieSSUci7UxHiW
 V7R3hPakaffN_VHWYVRzg57bmUIESkMBkHwKViXMUo7G1D9CaqoZSzFUTjyPzHF47vj3pDCzmNLR
 zF.vs23OxFFN2_W9mD9FV.iQi8ojmKnbkFtkpO7yub5cESqCq9XT_sqb3Ro_e8yaX2nO1cwwW3G4
 uA4YNv_bs068DRQLNeecGkhCzbVbHGsoMM_BafFUTFFdAx2HzPZmw25kSwoAleakFqtvXquiA_tH
 B55XohHVkf0eXfqP_zcry2xU3OoHYNnlhtSzYnZvUBJNJsDZpV_3mECiysqSvPxOECHvUE5zL3nc
 u6j_f4Q0PGz8BTyPCnrok4oJNnnkKw_ZoC3NszM7mtruAPuTiTQvCk_oKy7GW2w0s2uUPyNR5D4n
 RTldVwNs1XsfTNDJbI80lpOT_OSv..9bTnm7_M7Pc5xrcGUrFrR0sJPbTwAEUt5HgEvMlVGodo.Z
 YXg7HfspNpFb9IFciPidv9f3rv2iqFjrHti.ux.bOp3dDtffflRX0oX5GjciLwROrQL.xFUzmXB1
 j8VYVj2tUwx0HAhfZOLb8DvSq2_Pjrc8FvuofXMuJ72wk1EdOyk2Fz0X79V3eW92WyeuHME.aR7i
 UFwfJWXwc0yH4BCg561Ja8vM3RlsuyofVlevtjQP1zqEc3Se7GVxa8NhzNijkDXq8ZupNOPGYKQj
 ad55PSSW.snK_SreU72DEvegRB4z9O0JU5T2YittLRMgrZsSg9DFcqcnihsnXqzI5pSCbr6mxQFb
 MPa.7ckc2jeGTSk2YoaRg5Gi4XbOQm7H6eukBrnwdC.4.GLFsLV.zq2zDHYPkCsk6ltKIb4B0Iqc
 Ds7W8ODlndElBSadrk8Hux5phRWZKAYH_qOrIhXRjWvM9Y.ytDD227g.CQAkunNwqCUSVvEqYdoh
 U9YPesKR_GxPLeZeqQ99OD_lEP6pIYh2op8TbEDho6vjc2XF9b7ERIOHvBJ6C6GtKl9gjoGAMQiC
 EqEK_jkPIJlvQ87ImESAghHmV.eJmpXNtnQEZY0pDYJu60INSHYGy_3OFTOOOTTIdQJ89_epZqX2
 n5fWnnDUk2hydbCObopVPXsSmnsmPtl53rxjieAlCWZuvtwblKrF05lOEV.dnxI7aCKM1fl1xX_A
 gky2eBhZpKKu7YtA_tTki18WXdJkwbh_sfS6Od4Y.zqbZ2ivJe4pBA6z.wkGjXjXEVI_ANmty6LC
 93YFxjBMTsLs.gYJKt8CCeQf2zEM_MlM6kLcX6.6pYd3NZ5xSi1wYHlMDVWEJL4EkzNVyteesF7M
 WxWhUnqPSNTv6j_R7PySrid1LN_T5VWEyTSZaDrAzQyWyytCaZEzn8BGngMAxB4Hret6GTLDPUBd
 z70hJAMvRVCWhmRmQ2i69ejXdpQsl9hgtIyMPjgR_AmIkda721seen9jceynZ0GZ6ilJWTAdn_4W
 uqUDiL5w8CQHCN1T7DMWempst5ah9p4LmCS6UfL9XOpnOk000Vji0JjvSYhhwhC_QuesRQFmLKMI
 95ubqintokN99Wwup7emHwLFYxLfWI0EMM9_9N.hD.AWx2IL2U99zhNtjOgW36TCWOSkgsWqRCwO
 wzkv.gTNQkQV8SOmeG5nP3NnWa.XGzbbwg.A5dzwQ67ttXShFeFh.LA978s6mO7AJ88yokge6u.3
 _tZr.06Eu7tvNigjepi2M3bW2qWpdcEbSnMcK.vJQEU10Gj8VIJj6qOijAm9Ppti3F_FYQ8FZtrG
 Vx6rEyUEdWEbwd0.p6v1gowhrmI6X3uU5IcZRz4K48jUgxMNsFOrrLf4uP3Ajpues4JX5
X-Sonic-MF: <jp_2422-git@yahoo.com>
X-Sonic-ID: 71654314-e650-412e-9020-a5d903760e21
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Thu, 8 Oct 2026 11:43:50 +0000
Date: Thu, 8 Oct 2026 11:42:25 +0000 (UTC)
From: "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Message-ID: <348041964.128703.1791459745347@mail.yahoo.com>
References: <348041964.128703.1791459745347.ref@mail.yahoo.com>
Subject: adlp_tc_phy_connect [i915] floods logs with drm_WARN_ON(tc->mode ==
 TC_PORT_LEGACY) call traces
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 YMailNovation
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The issue discussed at https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12246 affects a number of laptops and Bios combinations, and appears to be the result of buggy Bios'es where the Intel VBT table is listing non-existent Display Ports on Alder Lake laptops.

The following patch skips the creation of the non-existent port early on in intel_ddi_init(), so preventing the logs from being flooded with the warnings. It uses a new i915 display parameter to allow the user to select the type c port to skip with a boot option, and fixes the problem. Please can you advise whether you would accept this patch.

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a46ab5d3d..5b9ebdecd 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -50,6 +50,7 @@
#include "intel_ddi_buf_trans.h"
#include "intel_de.h"
#include "intel_dip.h"
+#include "intel_display_params.h"
#include "intel_display_power.h"
#include "intel_display_regs.h"
#include "intel_display_types.h"
@@ -5239,6 +5240,24 @@ static const char *intel_ddi_encoder_name(struct intel_display *display,
return seq_buf_str(s);
}

+static enum port get_skip_tc_port_param(struct intel_display *display)
+{
+ const char *param;
+ enum port port;
+
+ param=display->params.skip_tc_port;
+
+ if(param==NULL)
+ return PORT_NONE;
+
+ for_each_port(port) {
+ if (port_name(port)==*param)
+ return port;
+ }
+
+ return PORT_NONE;
+}
+
void intel_ddi_init(struct intel_display *display,
const struct intel_bios_encoder_data *devdata)
{
@@ -5249,11 +5268,20 @@ void intel_ddi_init(struct intel_display *display,
enum port port;
enum phy phy;
u32 ddi_buf_ctl;
+ enum port skip_tc_port_param;

port = intel_bios_encoder_port(devdata);
if (port == PORT_NONE)
return;

+ skip_tc_port_param=get_skip_tc_port_param(display);
+
+ if(port == skip_tc_port_param) {
+ drm_dbg_kms(display->drm,
+ "Skipping creation of Port %c due to the skip_tc_port parameter\n", port_name(port));
+ return;
+ }
+
if (!port_strap_detected(display, port)) {
drm_dbg_kms(display->drm,
"Port %c strap not detected\n", port_name(port));
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index ca0ef466b..2f516ca4e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -143,6 +143,10 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
"(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
"Default: -1");

+intel_display_param_named_unsafe(skip_tc_port, charp, 0400,
+ "Skip the use of the specified Type-C port "
+ " (single letter in the range [A - I])");
+
__maybe_unused
static void _param_print_bool(struct drm_printer *p, const char *driver_name,
const char *name, bool val)
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 5c5a1a135..6356438f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -51,6 +51,7 @@ struct drm_printer;
param(bool, psr_safest_params, false, 0400) \
param(bool, enable_psr2_sel_fetch, true, 0400) \
param(int, enable_dmc_wl, -1, 0400) \
+ param(char *, skip_tc_port, NULL, 0400) \
/*
* Debugfs-only knob (per-device): no matching module_param is registered
* in intel_display_params.c on purpose. Runtime-toggle via debugfs.










