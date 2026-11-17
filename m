Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3390606A33B
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=j6R/vEOC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C110FC29;
	Wed, 18 Nov 2026 13:04:08 +0000 (UTC)
Received: from sonic309-25.consmr.mail.ir2.yahoo.com
 (sonic309-25.consmr.mail.ir2.yahoo.com [77.238.179.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3610E64A
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 19:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794942370; bh=bHoVPDymxZlasd3WC1fFT+bCo0fZRpzmuffBP40LipQ=;
 h=Date:Subject:References:To:Cc:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type;
 b=j6R/vEOCztJ+jpmcmuwD8jIRe+FySC64uzHTFkvH9TnWGL4WVAJ4MIWQbKJedu3NkYnYiCTTf7kH3XtdKLfoAFIbmFgnucUdT6q/MCk91SghzB736A5JLS+evJvTz6IkYLJNBspApuNqKbmtsRzROijtEM0AnCeqyl4Qyzp+B4fNG5nDB2blZDB5+93PJNm5RL3Ua6SbIkYgDCe85QzRVM1R9vGlxwBEXot4098pgy6Wm12tJ/EZvjtaqm26ASlREEoBQWp+mazG+6ytf4bz5d6yzoyeCwmZMkz1OS5Ui+oIm1Gi4nbiHgTQCNfa4K7dfMhnRLNKTBVwHKC/Wsthfg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794942370; bh=xcfU4YvjV8yfKYMfJD4m6A0T4PIiV5kulwAzkELmzpM=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=q+h9H1kAmse4sc8n2+HZ387psk35cJtDjd1EkqFXfKEMtHUBJvd5VbmzysQA+dakEpodnwstsJm9DnUpCzIqZ+BI8rbbvwFJT4rTwU/FX58Sk2+V8hfQSFnobnpwIG9DGRU/MLsEE05Azeab9tbzfY3g2Wrg0CagAQZtKGiGc0qWa3H7RmJ/dDyhJLRYOTIHIFnGEAnSEdna4fVbg+mziWwsAJgcGIHdTBW4NBBoq2E4/s3q/W475+9z71dp0ciRXg5y/Df1oib6soc9SPpHX4yw6IwmFS5YzltejdcB2CtiH0c5oyJfXj50/F4ll66zx3RZ+M2B0/jjoKtPSuCxug==
X-YMail-OSG: CO2oeesVM1nxc5q_cNculvm9dUpjKyQ1Q1Nm30Wb3pHMG9Y0LzOLqdyVXLM6ThF
 Gb0Gaxe9nqf5ZrqmAr2eMl4pS_rCX7Tm8QyOAflE1wlJqj0wP85VvCu_5f.kiU6ZrG22pn5.C.dC
 B2UQ7VD2jmsIXgzF30c8MvegRxUU9bR.ZtacxMO4xPIBcfA98F.B69OZumfwzxc2WXtCsJ6e.aiJ
 bXoeHsnx6prbos7GsuQD.1wohqECUA2hoi.hMNzmGmHyYML.thvtgGthNXGQuEDc0sZ9YM0zTon3
 _YeuPq4AtOTOvrej0wvV4mtBUC2dXhvVWLh_M7tdb8c2DcuFyAuKFFZQ7Z2_GsHEd2MEO4.W13.G
 JvZy75.O38la32vZU2HBC30QAUeDudK9mKvE76pYNzKIYQ6MjFtsTM1WQwkZ78tcLAXE4B2VgHSg
 Nd6XcIhoHWSYP2oDWxLCSlBP8UzqEDrQAJrWE2TjmZFBIkTMKIChxuuWuh4HL0qYf3rTfcWrNxMD
 J9.KxJmNo4oxjivPNyY0rTCHQAY7iYbO3sz7aFub_T4OE1ZXgvzlULYWF0SEaRgbSDTRm0TuzlSS
 yS72hOUVmjr0GZh1D7ghyxs1UnklG7a2i3zbQsiQ1mvGXyz6C7ZNsa2TbAhia3wkNX1v76F4ao9N
 .c5qGoyYeUKcXJt_X.nrGLFzjumk1MOjXMornWCrX0PbexFVkbeVcma89U4uF69a.AULr4UpdMKf
 _RGNyi3EiDBdeSVb.BlB1fZpsSwSg8B0IqwuXdzudV5qsL2UecJkhgfNPsLryZ03WqXE4RixoX7X
 YuswKtPEVTy8G4FVcf_IBkOI88HK19exZbYuY19JNZPR79k5DDobki3.462vyINLXL0JxoNq7OhY
 fXaMw17Srl0aUvbsG8gbI_rIlbLfNd_gFJ0uKqWDr61C11koWUXX3OwI.XulklMH6efZUh8JsMzt
 3DUSg7Db.bLSQapA3oXj1RuPdIghsX2UZPbIheFt1aoLSUvUPolo4B48vQfhtEMRhGHF3B4ToAKh
 uND.pwXEp61S1GfXOv5UJQhJDPtMCyZ8Mw7soF1_W3LiB1AYoBIpYo3GdAhgm9OUWfL2Z80kmG2K
 efDeqcieZByxTIc.gJlKCCNTe2fZdmbta1fJYzQXrH3ItAmTuvwzBg.93llrRJoJ0hX3tjnVH8bp
 Uht3R2DpamrjL5xKzhUw46NRiAECGkq0Krn2Of2SMvo3Sus.bRJ.FCNrPkL3G3nV25p5jfLLVaxz
 0clRxHOyPP0AR3UDp33kqj05gp0ISxbFpTAHNIIxjiUkvS9y_WMd4dT8tAyyjcnDD8XXEL5PHH1v
 rv2rcpIiochO8M.Pqj.IUjILr7BoeR1Huckxs0UOdsoas8quC.LDXwsP2xj.65snlXvVrfaltQoO
 X6EqDknz8WzkWfSn2g0oSYiRQ.AmqUq6zEp.6tnw2Wjv.JHyYy1ar7csG711Ba.5HD7CmCNOMpu_
 l0EVZPTK004BJbRjZf7fDlSm7iLcm8MTZR9PeF4SJ676.BLLft48ppYu7smCjkNyKV2GYKfA6GCM
 fBFfttf_sQbx6ScwKRw5FjCkuFGnKTwH3E4HtzEa5EVQQJWdVu0PMZbuu3pGolzXyCQZIjzEmK4S
 M1M0.C.qXEyfGmqFFpbj06X7PRj4Tgqrd12PA7PJyP6t0nAqNByplUJav024q_8vt2ugWGzxaD9E
 L5pIs3oER0M9FZ8L0fIvxWQ9jYF_YVGPAO1FwY3VdYs.IPiSh9VeQtvhBEqkqqkDGxLf1wacqYUJ
 8rbpQ7qlwCTpN1hEPznZ_tUbNCpcU8Elot1k7Lh8S7rg8sbd61kZUsLU6qTlUG9Y4ozh9AKg2IEx
 boZl180LbPyS9w5kbKGjrToJuZNNU0IEA8b9KmGyzUjbkO65cWdY7Qzprnd.9P55sEBEF0._8Z0J
 f_MKS86Slgca9VCImo1096lVBchGDEurfbCV4fyBmi0pMY0kDNAHvAW3i6NvJeA4CtyDoy_Poboz
 enzCfUBqlxpAj9GME5JMmIxlqL5UPtWDuNM5DNAfNYroNCG7MdmGYK0iwt6e5SeoFhSQOKcmm6hF
 _nbeY8djXa2IbZlak1X5ekKqo3taCqMYScuBf_v10DCXnEpuq0zXIdGtRsUtIUl9UerWBOdCanKP
 TmVeDuHEof3xZy8mjq_j.p51u4KAT_JfHah._pif6tusX7mgavUoaWzn9qrsdSFrElaAsr7s0Ubw
 nMVPm3I9L8Y5YFKGD3N0iSUAfUfKR2ggxb2w2DxlRYb7Tg7hoaVyy6A5kQOFJTjYGBiok0n78z79
 HPy5X6Y4980WdbWAG2UhjzKjvyT5HZvZw_WDc862Z
X-Sonic-MF: <jp_2422-git@yahoo.com>
X-Sonic-ID: d0298ef1-9b03-4d88-8188-34de2bb25c41
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ir2.yahoo.com with HTTP; Tue, 17 Nov 2026 19:06:10 +0000
Received: by hermes--production-ir2-5dd9bf4598-hl2mf (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6b1a76ce03c31e9640c94c5c639a7bb8; 
 Tue, 17 Nov 2026 19:06:05 +0000 (UTC)
Message-ID: <629d533e-dd1b-40b6-b98d-666aa4614c03@yahoo.com>
Date: Tue, 17 Nov 2026 19:06:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] adlp_tc_phy_connect [i915] floods logs with
 drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
Content-Language: en-US
References: <5f2de375-9b04-4bc8-80d6-a5c416a784df@yahoo.co.uk>
To: intel-gfx@lists.freedesktop.org
Cc: nicfio@gmail.com, jp_2422-git@yahoo.com
From: jp_2422-git@yahoo.com
In-Reply-To: <5f2de375-9b04-4bc8-80d6-a5c416a784df@yahoo.co.uk>
X-Forwarded-Message-Id: <5f2de375-9b04-4bc8-80d6-a5c416a784df@yahoo.co.uk>
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
