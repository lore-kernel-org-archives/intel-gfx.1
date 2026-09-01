Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20FC624D9
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 13:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC9910F1E0;
	Wed,  2 Sep 2026 13:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="fI7c+mPx";
	dkim-atps=neutral
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA1B10E38F
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 20:36:37 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-936dfd009d1so188890285a.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 01 Sep 2026 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788294997;
 x=1788899797; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EyAYuLXXzVtKL+Vc2WL6tPFoU1yZSAFLWXRw34l4tAk=;
 b=fI7c+mPxnGqiJ0k3b/RT7p2k3C3aQkYdY6AlBR0CbV/sJgspfrVe3wYIJDMVopSfWL
 fsnjNxGc5sblv0DoWhidTdPik5YH+h3xuCiqyEkd4iRwrH8zYA0sR/3//TlRccfM+MS0
 7VBBtlco4UpUGL+zWHH3ZkTZoq8yr+gCXL6Gd0axNxN8lptlJVqnioTjVhDsA+JcXFYN
 cxFziVmH82UTTNEejpwJ3zuM1JMh8xng8EqgO/YWkQCz7JO7jjrG3kuJ+1tsICQndMkR
 Y1JCWserUsIfVzafDA+GomGF9p4LyZLUeJGYRhDRfGFaes/4n9/ZGk64DFAAMNz/axOw
 SvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788294997; x=1788899797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EyAYuLXXzVtKL+Vc2WL6tPFoU1yZSAFLWXRw34l4tAk=;
 b=SqdcayPbeCOwKi6dNdjlI7Q9Qp44GPkfipJzcvbyUelDQnArxSBHpSqqFNFHD3+2gD
 F1qKTJcH0+INnGdGoz5lcCm1m5zPQ0qyUWkCc3Ea3TQLrc9qdgwdXw4NH8U4jv3bX8+v
 EJq1dofYZ5WGrD1MIu/I+wNtmTE0jHt2R4IKlsWz/MAklS06r8zDsGdf7sTfeAR21EOf
 9/q6fBK0HayRLR6f+i63XP9jWWMZESBPDlh3SiMT2sFWSuuAt53B2Ug0dRyTEnxXl4gG
 VXGhpw8g+5+n50wUSldo5rBou5uWh93OD2IXQq+tIcKpFTqvIs+ehlVKzvOmcnKgxnvO
 Euwg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQiJ66wPHU3mwMa7sjRwQ89d4tQw2pqYQiyJ6xdp2bn1IYYXcfFHuza7HJXTxCJh9Q93If2XYMdC4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kwjS9jEwQBdWcJnqTyLZ6qZTj9j2rQ5u00bFaFjDzmvPBYhQqH
 cBZYF2+ige0y1V2NJ5NIcH7zTnKTcNNr4lOigLoyH2J6m03z8FxeY/DkuTHgM3G8nLr0eJJzpun
 6DFfBvJ0=
X-Gm-Gg: AR+sD10/RSLMYiZ+aMwmKr5CUBXXoEz73MZsJl8JnR4+6G/RO4C3mKZgAA6lNlTg2/O
 0ZlBsPB/+ALjPqbvtpb93CGrW8F2fBUsPEpD+3Jz1er2JKIGW4sn9eWjl9iOwZymHBsiceca2pj
 YCnLnWtSzEihrm8kFrgrHf14G5hRcHz//YEtQuefhm1SAI51/WgSIUMsaieaB386Rx6bOXqObBi
 tgCpjmYi+qWMdbh1urIplYeLxwMUWqDaw/kw4DK1FdF2iJHge0vRL610fTAbzvQqEAmJPf2fdac
 c0JMsS1qWfahCDEA8FoL2KshQu8H+IcHDoclbxeuY+YKtsiJnrJzIhHlfz+Ws2V7+w+/h0SY2bw
 xW/cbdd8JW6I8sG/XrGOgDyn1bWDo3n/Ai9poQmVcvYMuoO4IsGY7YS7wpDPa6+fSiWQ34cMoOS
 JggM29CkEFrblv39zldXQYNF11MqLn8mY893+PpEXd0QVOVawhuaCfFV1uAEFRht/mfMFXbDWf7
 Hzogn1phbaxeJVgQ9iazy4DbftWTTa9D6ss+tWJ7u1dAII6O0bCiyRR+E8elltrodixVoEEDSNX
 eklEV47BXml9vtSHU6k4SX4LvnZTtr3RfGnahBrNUEEQ1iI8JwmLT33E5w==
X-Received: by 2002:a05:620a:a411:10b0:936:ce17:7792 with SMTP id
 af79cd13be357-9394bbfcd67mr879893085a.8.1788294996544; 
 Tue, 01 Sep 2026 13:36:36 -0700 (PDT)
Received: from jake-laptop ([153.67.1.208]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f35a3f3sm27146285a.27.2026.09.01.13.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 13:36:36 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jouni.hogander@intel.com, mika.kahola@intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/psr: clear the Panel Replay error status register
Date: Tue,  1 Sep 2026 16:36:33 -0400
Message-ID: <20260901203633.92628-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Sep 2026 13:10:12 +0000
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

psr_get_status_and_error_status() selects the DPCD offset to read the error
status from based on whether Panel Replay is enabled:

	offset = intel_dp->psr.panel_replay_enabled ?
		 DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS;

but intel_psr_short_pulse() acknowledges it unconditionally to the PSR
register:

	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);

Under Panel Replay the error is therefore read from DP_PANEL_REPLAY_ERROR_STATUS
(0x2020) and the acknowledgement written to DP_PSR_ERROR_STATUS (0x2006).
DP_PANEL_REPLAY_ERROR_STATUS is never written anywhere in the tree; it appears
only in the read above and in its own #define.

The sink's Panel Replay error latch can consequently never be cleared. Once it
latches, every subsequent short pulse re-reads the same errors, so PSR is
disabled with sink_not_reliable set permanently, and until a short pulse
arrives the driver keeps Panel Replay enabled while the sink is reporting
errors it cannot see.

Observed on a Dell XPS 16 DA16260 (Panther Lake, Arc B390, display version
30.00) with the eDP Panel Replay quirk from commit cb8d155b0806 removed
locally so the feature could be exercised. The sink reports a persistently
latched error:

	Sink PANEL-REPLAY status: 0x2 [active, display from RFB]
	Sink PANEL-REPLAY error status: 0x1:
		PANEL-REPLAY Link CRC error

which survives across reads indefinitely, while dmesg stays silent and Panel
Replay Selective Update remains enabled.

Use the same conditional offset when clearing.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3885,7 +3885,10 @@ void intel_psr_short_pulse(struct intel_dp *intel_dp)
 			"PSR_ERROR_STATUS unhandled errors %x\n",
 			error_status & ~errors);
 	/* clear status register */
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
+	drm_dp_dpcd_writeb(&intel_dp->aux,
+			   psr->panel_replay_enabled ?
+			   DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
+			   error_status);
 
 	if (!psr->panel_replay_enabled) {
 		psr_alpm_check(intel_dp);
