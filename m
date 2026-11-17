Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B22606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=o7XQCh08
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE5110FC2C;
	Wed, 18 Nov 2026 13:04:12 +0000 (UTC)
Received: from sonic306-20.consmr.mail.ir2.yahoo.com
 (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2A10F88C
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794943000; bh=rqoL+EYcpXaw+agDirWcpnuscezt3sxzik2SP0KTC/4=;
 h=Date:Subject:References:To:Cc:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type;
 b=o7XQCh08qVgoneOB4mCKCp3Ll4KwTzQdI+8vfJ3sxf5F+ZqoVohbtOH9EvJr5SHOLbNtVFn+dY2EKc02UkX1iXRIe+QCRmghrlRvxfOncyoAHHVyZpXE1lZNBMFiwK3mu8ncvg4Mx9lPq4K9Ws4PJ+uGHt3tit6ueCuMhDd4b3wOb1F463X9GePtoGsV8iqZ7P0RmVYun64GasutNYyDXEutP4/dv781y2cZuwK5eVaQ1+lvcEvTccOcRZ9IMp2qPJzD9hAr/G04lWL71T3lnSlAYhm75MVnikJohiakOp0r8uNgQv5RkgvfMnA95VySC+Gkj0y5ZIA7i+ifFHqaUQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794943000; bh=3HNrG2Rd+meH71hkZlpV6JlJ2DCAmtQw4wX2+kY3A1H=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=fFFVHq/JP6QWXJT2rG9YjbcKYX6KQKsbwXjyBiXlC1PiQ9uj4pZDG1CKZUXpo58ku7DLq63yEQkoKtVkL+fT8oU1kxAy/EN6d4FiDGFg3RJug3eeNdmz4fVLnrJalxHdV7yUXBEVVvhujnuKkfgzULJ0ZOTMjtW+xYpHoOOdBGqu1PxxkNoTEdF16nAnJmNrn5tAF/9UPp+07x7qCuC/RCIQvJqnYqAt1rTitbMUC/5yymkNDymou8VgciJAaEmq1xRtjUH6ramo7BXs7VfAGzOJC0bVW6wEdqCYbk9o8aKzxsT2HdHi4PN4WJbxaA0yy3W5WuItQ6VC9Zb+KvkBig==
X-YMail-OSG: 65_7G94VM1nlkIFxJ6PoTqrw_TXBE6Wdkg5_qjQpJxQGd1IsLDApQPtAgFij.ji
 UbQmHl7FXkyqWuHlfbsT8YbJDZ3rDuSwGF3sodGnTQLlatSjZxm4tMl7aJRO4PEQEy2FJAGrc0Ba
 PH9fVsj1.ygWetBc.DaXOPbansAshANDi_tuUglZetBz.usxVX6QpWfO3fuCWIg_N3blqr0Ru4_z
 XCibPHqtK66IOHJrJmAfUDUlx0a9vgnQV0ClsbYGyEvUbt6NdaJikctILOB8zfT8EFklEgeqPwUt
 5xDcniVX_uf4OQ9DcmbbVN2eSE5t1ji8RFVfWUPoNp_976aNYBxq36B67_sfMw6tpePyJFjZ2bJA
 9BvHPXE..SnKTsVjWRcT_HHlwgQDGDMLC2TqiVG4OoDFp9AWjx1FtMhy883dgwIajDVh2l9JYJD9
 Nk0xexaDokCKCMpuyQfZJWKTITJFGz2N_B9jQyLa0OqCH.iWz478ohpnx3PwXA3i.1_sih3Isysv
 K4D6SdMadoj7q8rafkBkNhw0gl8wgr5GRekyQdNqdsNjhWiPN4M.LKLD10u8QHsJqsaQyD8.NcUT
 0ERgM_rfKDHXsnPnY4.TOAxe9Gc7QIsHxJGFAkhyFdc5e.QflhOO3TFc5X5vV3CBNyR0iiveiwgO
 CDDY5RQ5AauqfjHl27M8cRMw3WDHMpnf5WKD4ExbTv86sxnAGuWGnW2Hjr_vfapBklY_1qHnrYUN
 RaSDeod4DM8lAiihzTA2UzDuSfAPFrcq8jPI79tl.AHtcNwnQo9sldjgy6Ya_t8XV49PntJYSvKu
 8R28.MtDOA2mVdKpTYAflHJWpSZKZJsk.DKSvS0vJv0nZtqjCzGmWVC8z48yMU1J3n9zqjEp9aZk
 yI3tvHl9rjWQShxkITsVlpNxdtzmpn3hRJUWSbv7H5_S8KRq5o6PHn0pivYb9WutACds5eBt1hT4
 J6Ey9FhAd5jcm7OCa1FuqS_fi1_EXSqmRFuo6e.PpE40xVD06Bfeb3b1Mfwww0xD70IE60SR0ML5
 BkbTYWStH_lOtXOjZIdNK1taVGQzOVacmqpKkHwpBiESCOpvWxoekPjOsgsUbaSo5o4g5_AyFdgS
 vAVQ.ySCOm.cecPPfapel5.5.G3lx5JDHuKvLhh8qrpYgI7hoCBRPOkyTj2WPe.yKRbxeXzkUi1h
 nV4NdHwlyoRJnnaqxaguGhPC9i2f5EM9SkVFaPK5TliKXZYGwpJN2pvPQAkoth8gJ0bd_ZaAAFzX
 ZrXuvxloGVhNpAsZatMv41osDEDnd0CjlM_lUaDnPZz3V6x90OfhuUujEd8J.Vc4lz3NYFSGznAj
 dvcVp2_b5xJtowhHeUaU8mxalCvvSbds11NrmzAJpLfmk0Tsnr5455YqzBW1e23Kgi5QyYLDB1Ru
 vVdy0tF3TdX58zn0MsiD81Rl_XWH3aKtFsJAaiBFYM63wluR9V2fywVLWVfZ.8UKOOnwFzVPTk4M
 7ZWuqEsr1WOJ.2krYhK1uxi36hVplY8Nxoi2AnfPgH9FnsH.MJeBUDLU0OKUy0NLjbuY9WIEqUgR
 0974YnpcY4J5NROe.Iq4yAGnFp7sb4dSE0hPCA4RsJCAuXvdjC9Oym44NylgvYDnGepdvUzUrQ.U
 IEvyN9jCUDfBRvAAyPRCWHsD_MhoOHMLtic05UGEWXHEDYHjIVQ0lrJo7kfFgHRalcu_ztTlDT_9
 cseOZ0lroJB5iWMFRlPMls4ebhKdaojLskckTVG3qUqSLi8PV.K6KreBGZJAaOxe.0UaXHT6si7.
 hOnxb5Blb1XkN84LnSCwlHjqdH1PKKKbFp2g2jWFM5.a5aP8jJ4jqmlOv392Q8XlnRMF8d0o7T6K
 fmmTHhSBcHsSq24E3J.cLF2S6ta7jdgONqvpytfEo39yBGmRqwbHj0xYP4rVOR3dsjlkyIC3mBVp
 iZqmiBZtvAjI1eSOOS8c.sYns0iMtBPMc_o75BUrPwYEcIWEv1Hiz8blTiQ8s3yPa2mHmHMPQHV7
 csMIMQ4rQDHeVhXttjps9tT8j0iR_yGesAI9stnPN_.g_Hw108eUc92njFnta.R_J8lUTPTVbZ3y
 7_xlZXcN1wD75q.uhXx5wYX0vMi6pIPCBRQq83DbLI7zuDAhmJ.51uVCPQfXmW19dAMMnXwQcUuU
 AigkeaQv43tEyk4TRn3Ie3Sc1sKi1aL4EHPL2_.9pH3wk32JYJBRDX7NU0earmShQKCLIwGMgAxg
 mWWqZfrKAAGbjqbVNU3qdb_Hb6NBHJ4RrlC.pYo4rcmrN9nnySYL632zaUFUaZe8PfVMXMuoSBCh
 vkmPV0whvH3YK_IP.7WS6FtakLoLazDyLP7OTXdW9
X-Sonic-MF: <jp_2422-git@yahoo.com>
X-Sonic-ID: a92af504-695c-4a99-9e14-450b13423de7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Tue, 17 Nov 2026 19:16:40 +0000
Received: by hermes--production-ir2-5dd9bf4598-hl6xw (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f082f37f89c218a72166e4631f8511d5; 
 Tue, 17 Nov 2026 19:16:39 +0000 (UTC)
Message-ID: <99f68f25-15ce-409c-9a6e-f9365dec8ef3@yahoo.com>
Date: Tue, 17 Nov 2026 19:16:37 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re : [PATCH] adlp_tc_phy_connect [i915] floods logs with
 drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
Content-Language: en-US
References: <629d533e-dd1b-40b6-b98d-666aa4614c03@yahoo.com>
To: intel-gfx@lists.freedesktop.org
Cc: nicfio@gmail.com, jp_2422-git@yahoo.com
From: jp_2422-git@yahoo.com
In-Reply-To: <629d533e-dd1b-40b6-b98d-666aa4614c03@yahoo.com>
X-Forwarded-Message-Id: <629d533e-dd1b-40b6-b98d-666aa4614c03@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Wed, 18 Nov 2026 13:04:06 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

*****  My Apologies - wrong patch attached , I will re-send .  *** PLEASE IGNORE ***


-------- Forwarded Message --------
Subject: [PATCH] adlp_tc_phy_connect [i915] floods logs with drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
Date: Tue, 17 Nov 2026 19:06:04 +0000
From: jp_2422-git@yahoo.com
To: intel-gfx@lists.freedesktop.org
CC: nicfio@gmail.com, jp_2422-git@yahoo.com

With a further report/example of this issue together with additional testing carried out on a proposed fix, please can you consider accepting the following  patch to reduce the excessive logging produced by the i915 module on affected systems.

Issue and discussion at : https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12246

Signed-off-by: Llyr Arthur <jp_2422-git@yahoo.com>
Tested-by: Nicola Fiorillo <nicfio@gmail.com>
---
  drivers/gpu/drm/i915/display/intel_display_utils.h | 3 +++
  drivers/gpu/drm/i915/display/intel_tc.c            | 6 +++---
  2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_utils.h b/drivers/gpu/drm/i915/display/intel_display_utils.h
index affa3179f..5d8cc50ad 100644
--- a/drivers/gpu/drm/i915/display/intel_display_utils.h
+++ b/drivers/gpu/drm/i915/display/intel_display_utils.h
@@ -12,6 +12,9 @@ struct intel_display;
  #define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
  			     __stringify(x), (long)(x))
  
+#define MISSING_CASE_ONCE(x) WARN_ONCE(1, "Missing case (%s == %ld)\n", \
+			     __stringify(x), (long)(x))
+
  #define fetch_and_zero(ptr) ({						\
  	typeof(*ptr) __T = *(ptr);					\
  	*(ptr) = (typeof(*ptr))0;					\
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f878494bc..bb09ae795 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -312,7 +312,7 @@ get_pin_assignment(struct intel_tc_port *tc)
  	with_intel_display_power(display, POWER_DOMAIN_DISPLAY_CORE)
  		val = intel_de_read(display, reg);
  
-	drm_WARN_ON(display->drm, val == 0xffffffff);
+	drm_WARN_ON_ONCE(display->drm, val == 0xffffffff);
  	assert_tc_cold_blocked(tc);
  
  	pin_assignment = (val & mask) >> (ffs(mask) - 1);
@@ -329,7 +329,7 @@ get_pin_assignment(struct intel_tc_port *tc)
  	case INTEL_TC_PIN_ASSIGNMENT_E:
  		break;
  	default:
-		MISSING_CASE(pin_assignment);
+		MISSING_CASE_ONCE(pin_assignment);
  	}
  
  	return pin_assignment;
@@ -923,7 +923,7 @@ static bool adlp_tc_phy_connect(struct intel_tc_port *tc, int required_lanes)
  	port_wakeref = intel_display_power_get(display, port_power_domain);
  
  	if (!adlp_tc_phy_take_ownership(tc, true) &&
-	    !drm_WARN_ON(display->drm, tc->mode == TC_PORT_LEGACY)) {
+	    !drm_WARN_ON_ONCE(display->drm, tc->mode == TC_PORT_LEGACY)) {
  		drm_dbg_kms(display->drm, "Port %s: can't take PHY ownership\n",
  			    tc->port_name);
  		goto out_put_port_power;
-- 
2.53.0
