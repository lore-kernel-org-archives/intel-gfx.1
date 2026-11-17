Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E446606A320
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ff3GhV65
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0010FC1F;
	Wed, 18 Nov 2026 13:04:10 +0000 (UTC)
Received: from sonic309-25.consmr.mail.ir2.yahoo.com
 (sonic309-25.consmr.mail.ir2.yahoo.com [77.238.179.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA4F10F936
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794946162; bh=QKZGb9DEL7XcZro4fKFJ48TIaehAT8E7/zMigtbeuxE=;
 h=Date:Subject:References:Cc:From:To:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type;
 b=ff3GhV65r6FWaxItp9fHBU1L5HAQaWJyVROXBATBbJo58+UmzIdW6xpUbtTae2LGD8IhRVvaL1Vj5rYTRPleBBK8cbej8uSTDZV0T7s2cKLDMyU+5Kusw6HEapySUKeDiYnkotQdrh0Jcaz/1IMWLGS4mYyzuGBrrColzC5CkWFkEWGmRGBeGOzj8hFHVclRW1nLH0Ytg9OW/Sie+zJEg8YfrKzlETqyQwbbeFiPwm9XqXNA8bM+fOp/KMCWkQWJHLb9iFMY6/75IWSbHS1+3exONXA6g2TA/tJQBn3cKUcER+dnSX/vmyYt2sDZ6+1xCdw0jqUz0zgdFSldicQiVQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794946162; bh=pouD36jXwWoiaca8XifPjTBp5CReP1sBrhl9np1jsFA=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=XxInuro+jeZcAeqyW6nAUnDy8tPNUkJ0pi+BkmtfKpaWgGh/sUgBnxU74hkUENOcZgtgKBMRg1AOFkh8u/uOH2oWJlVInt15/XjL17he8ikuv5a4WcKbqDlzXqr5PemNSH3yS9CvncUZ4PjIabzcrV+pzP1tSAOla82cjkT9cfQL+rmXGPYQ+P5KJMJi31VHBSWE0A0rfR7j/qkK9YB/Mmo4H68PyLOyj0oLlbhDSYWDJDVkSDqTzgBx81eiQI2D1MQLrYd+GkalRzHcLyP2hC7EA82Y164YMZVV/4soKu7bGVE4WgdxdR6z/R1cWrh2PLRv/RQF77s03WNiQtUmiQ==
X-YMail-OSG: .m8I7zwVM1kh7q_23xPAndnTKk.l0OvQr_C5v95oshBvw3970YY15QU91xE2Sld
 uL6klg6b8MsWeRC0sxHFWo2PVJsthFnYJOC_OB_O5gVUiDYH9okbjfxPKT6wK4JIus0QeP0XUEDe
 JWwNH3r0Z68hR0B08jMmEpw9O.gFIN8s.6FCI_S7ANl9sWruIDEB9YUcPwYGxoyVWKSNCAmXWLO7
 ZzxwxV.Mk19.ndDRvbyssBq75m62UCz3Jvgx7gZmvD6xo9DoXwSuKYemzcYKG66CIIiZnQdtN8Dx
 B75uPpijiMbjVouDsBc4xSFPsMgv4H2d8uSxMTrnyfKYBjQRIccOXWH4HbK5YRnn2ZVSh0dATQmG
 P9uvV2Li_tiEdx9tJMugqwpsFCSfH0sqPYMI8l4lixElyGIqLPr_5NfpH2NQPOq2Bu3T.VoxPapm
 iUsXzvb0Q7.maHdcvRCTLhTOIe.rzgOvieRbXmCb5E28vUrZsV7Mg7BUKZkvLozQD4xTqSjij4BU
 FHAaEwVyw6nH.QNPCXr9P8KPrEDXzimqA2ZALR4QopTCYieQO9qXM5sPuq_yR31.lKKAVoKxdYjQ
 7YhjCiup71o8JoKDFuA6vTKWt5B1bgXWSqcQ5PMCUNKROYEkb_QMLWMv8WCOKwl_D.IsmoW1RUQw
 2lWBHXeUH.xd7dS0T528zuxymfjoi1S9rNOrYnRzzdPGcG_lXLxUVOKShA6tdYL.Q57M2_gOfZWN
 9rdoBKxskkUd5IUmxG3WaMpNeW1nR7c1Ci_DMmt81fRYJEG4UwxuTQdlWauG4e3YvFGbbO8Bh9Nc
 _rCDKpwKhlFZBqyjs8nawFye7p4eRdL4_MdeedyB6llUhG4GTmpUFl.Ii6lYdBXXd8FCsErTIv23
 vuwxD3hhmlRx.33oh0KeKqfJR.RVTep5vZUnUFNjnnFrk7Y6FYUHtPUA6hXcMEjn8U1NWarDtIrJ
 .xN_UY736kO1Yah0br1H9ggY6.ORe_6rWIMV_mWlDm5AQHDatMgZp0gAvfnp8wT8jh6Mjiyo_41s
 voCYUOLLYO5KFCmScVEgqOngXbvpnx_bhiH4z7UeMi7wDtMihkTsS9klp2Pti4DcG0s2bG3SxkP.
 XXWYjzBbUhLgN9OHaSq_2Qg97F5C0wzZ5trsPkiM9I1GaoRvHxSjNQ5xGnFb.fp8BQuGHgfulPcl
 Z8MU22niEERxtd8Q_0nBijDcC6ZgSULmX0buQcHCyoVhVz0GElg_ekFQbBjr.FrIhbun3o3sIqKf
 ll66x8S_oAruO6zYbKf2q4XAi55cckDFL9VK5.42Dso1nbSMyYnU8ffpBftOR.oKVtNY1LL6bNdw
 c4SDYyN9aYc0u2G_Fk6npheK3u9Fznsmug8ugcetLrGJoGCt6uAaAzton9VNvsLgwGkAHQMs1deH
 xh_P7nTe4hw5cqX_6ehoIC8yPpMYsAfCodUeMVtLhyN1IpDjT833eJPz88Ct2aMu4.J.kLMYaZhy
 B8k.BxdzlNOrDREGtcv0Ra3Iuy4h0jzTU2IM4FyFQjsqbNn2TTRLmMBYsr7u0JhBgAVqgYX2LixE
 8fZkS5ynmLg3WEyfSzevaxxFf.4fqGcvntWbwORYogarNXexF91aPot0242BiYto6qxBeY1GxuFD
 9kfLurl1ebsfNVBFYrk8H4fNKf8vfrkwzTr2Vr_pwQQjqIYe6qzV_DB2hnKPgLKgxjIqTVExNk.v
 27DPJcEDUZ41UUImzK7aPTalo_RVkIj2TkrTVeKPRVqWgVGIeNMLbz3CmE0COSigEOYpYHqiltz9
 kr17PgHsBR7WnLM0ewIGxVD3jLmvm1Mr3ebpO2YXEY8bXmhQTxFKIkpssKniT3eySTGzkpiBPRcE
 KgpZM6srmlZqh1j2m0OITdU1lzNIT6JvrxbTs9f3kvr6frbdGf2VMOoCWpsoSm4uGIuoJCcnHK.f
 oS7ICE.AJVht0USqOEIDQ14XdiEBlJ8Na0AugOjIwtuF8OvxOxw9D.bYKJJFoLbzb7QWg_AUtBoW
 SKntL9n2G.tH6zeMcZsM9Z2rogz4fyZDzzPR9mLvMz2oebonRnLCBnI4_a26YXF_J3b82dfub7MG
 6J4NTJJQgALXkrc_r8uCAMt6yGj8XfhYh4aRvCTAQFXcKP8ZGIr7W_ZGwfzm7yL8qHYJ9syggUHc
 wgvLTiJoTwprS6UVy3Ernwp1SxVUEsKb3vb.AjLsI9TB3VZgiRu0eSlelUHs_6JhumQje6xTjdK6
 x_KQtpqXW.NvM_eV2jsGlSSCWLdtV8r06Hrp2rkO6mVLMynZX44HJ1GDUASMdA3FW2sqwjiMTF_i
 MLwYyCH0RAPGp84n6jniu9h4IIGR9cibDq5M_OMIF
X-Sonic-MF: <jp_2422-git@yahoo.com>
X-Sonic-ID: 4fe5036f-b12e-4518-9a5b-2f732e9b08fc
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ir2.yahoo.com with HTTP; Tue, 17 Nov 2026 20:09:22 +0000
Received: by hermes--production-ir2-5dd9bf4598-ck52d (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID dd377d82f63cc5114d68282a6674e28e; 
 Tue, 17 Nov 2026 20:09:20 +0000 (UTC)
Message-ID: <378cdd1f-9e0e-40c6-9d18-5fb7a4977d67@yahoo.com>
Date: Tue, 17 Nov 2026 20:09:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re : [PATCH] adlp_tc_phy_connect [i915] floods logs with
 drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
Content-Language: en-US
References: <99f68f25-15ce-409c-9a6e-f9365dec8ef3@yahoo.com>
Cc: nicfio@gmail.com, jp_2422-git@yahoo.com
From: jp_2422-git@yahoo.com
To: intel-gfx@lists.freedesktop.org
In-Reply-To: <99f68f25-15ce-409c-9a6e-f9365dec8ef3@yahoo.com>
X-Forwarded-Message-Id: <99f68f25-15ce-409c-9a6e-f9365dec8ef3@yahoo.com>
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

(Correct patch now attached)

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
+                            __stringify(x), (long)(x))
+
  #define fetch_and_zero(ptr) ({                                         \
         typeof(*ptr) __T = *(ptr);                                      \
         *(ptr) = (typeof(*ptr))0;                                       \
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f878494bc..86d6ae68e 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -312,7 +312,7 @@ get_pin_assignment(struct intel_tc_port *tc)
         with_intel_display_power(display, POWER_DOMAIN_DISPLAY_CORE)
                 val = intel_de_read(display, reg);

-       drm_WARN_ON(display->drm, val == 0xffffffff);
+       drm_WARN_ON_ONCE(display->drm, val == 0xffffffff);
         assert_tc_cold_blocked(tc);

         pin_assignment = (val & mask) >> (ffs(mask) - 1);
@@ -329,7 +329,7 @@ get_pin_assignment(struct intel_tc_port *tc)
         case INTEL_TC_PIN_ASSIGNMENT_E:
                 break;
         default:
-               MISSING_CASE(pin_assignment);
+               MISSING_CASE_ONCE(pin_assignment);
         }

         return pin_assignment;
@@ -930,7 +930,7 @@ static bool adlp_tc_phy_connect(struct intel_tc_port *tc, int required_lanes)
         }

         if (!tc_phy_is_ready(tc) &&
-           !drm_WARN_ON(display->drm, tc->mode == TC_PORT_LEGACY)) {
+           !drm_WARN_ON_ONCE(display->drm, tc->mode == TC_PORT_LEGACY)) {
                 drm_dbg_kms(display->drm, "Port %s: PHY not ready\n",
                             tc->port_name);
                 goto out_release_phy;
-- 
2.53.0





