Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238D606A32A
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=TIMNWBYf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C18A10FCED;
	Wed, 25 Nov 2026 14:59:04 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8309110E130
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:36:58 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-949680e6d82so517453085a.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534617; x=1796139417;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XfcsbYjAJ0vhyPQMgTUzJ/Zehue/sf644GRkC36iL7E=;
 b=TIMNWBYfQnKL5A/2nb6kh6ST7EQB/e9cc7ZgZGnIQdGkfJqiI8stnVwYN70Kk2wP/j
 RXzjvgCOWp0iJx4nDu6p9AUEOGKMWDHdqajHmuZ8oawcXKxt9AnG8oy43EKYV/JGprNQ
 dUJk48NTvxBD9GVzzOhpS3I0QA9f8PCazVW2Nl6/hBFnoWb2kYfRdlAYh6V8pxbT8GAu
 DKZQYDGu5CzQzsuYNaBaeBLdOcU18xL8uRmK6o0/evx8ULd1bBPph2BP5QHT8Eqme32d
 na6jbxuuCkyRDifKhGpLOW1NwjBY8Y7ZNNj/lXSbouX2yCLIpgVAhmH7OTUSIONh7BGi
 vadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534617; x=1796139417;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XfcsbYjAJ0vhyPQMgTUzJ/Zehue/sf644GRkC36iL7E=;
 b=Qq/z19dfeuunyboWldZ+HJfoke8MWgZUKTDhBFXe8fs87tf/B0ccdhwGBrWttNUXll
 zsbmyVI/LmEf0aleG1raKxh5lwT58uBGqnKUsicolSNUFhpWCVPkOox7K7Gaz8KO+Nf1
 S5ZR3YL4fnXR298aDu2jsLToPdCMGbTxJwLoBkTkxC85ADBZeWuOQX/55V/wYeFVUIz6
 2hez5yQdzhxNLRMhuAjGhpeNk6jq7sxXsWqBTkw0p8MK3EP9YmdUCr9WvTxjOCbzX+nP
 sZ5i4cnLFN6KiP+LAamD7eyvwn2/gzte2L0k4VW08xnYCe93s0IMVi2O8skL1ZLZew0Z
 OaRA==
X-Gm-Message-State: APuU4Z/oLjDg/7Re1uGEDCQv8e/j7igJT2mTlENgEXSBfP2irza3D38j
 kqQlI8tAqdGNSGBZgKFjn/TRgzkmb1MrVb+nYuZa8QoBv9LmJsJFCjtuWD/tCCTXdFo=
X-Gm-Gg: AZFdTZfmvnSvzaB6hTXSWzUdt2sFUHXXnbnXQUyjnmPWC/U2IvgG90RwzYFxtprwic7
 iM7ozFvfN0oIEgYJn/uZw8BHNbsrokCF635NNuS0gwrWnNyD0eD9EFoMm1zlnRctc210qx6outA
 wGRbpLS/4BpAMLLPtMfyDYw3rjHb/L8sFJ1gmFjulPAFiRFKppYqhv1VQWcMX/HvtKJkdfB5cto
 eW93crCLAADAEOMSI3xn6CuudRbJ74i6r6IRe5yIOdQUemMkrLWrLILQPeaQbDZj1pRhVeptEt9
 +mRGxj/RleVX+1x9iR4D+OPHMqka3S3Sxp3sX4pGXTo0NC8D5K2P3Nho7piOCe1fn12ixTefvsp
 iYKMVDNUTFbQ4GMPu0IPK71F+ZfiWxZeX93BBD5/5kTV38HxZpvHrbyBmfFrkM4omr/caD0OMqm
 i8tJClNEArm8GIo2/d01JhKcjiZLJT6aJ/00QGpcyUXFI2cvcoa+VHywAfPpmcFsXqzBS0858kK
 SUugO2gf1JwlS6eZYdzPSsUROsg0Q8UzcUVu3xSJSncoanqMuYREDvvzKNCIRX8pMtOk4xASFLV
 wXarWNrop6J9tkZ+La72X69D4XHMxr0eh0kA5UotltrgzKReEpohqWB0N/vINNcgx7JFtpgTb5r
 Ean2UAF3Kb8igxplQFrcyqAeBq3SmC0LzPHsm8+XxtZwBhvDpTvlbdKqJFRIYPYEevp+v0BIyeX
 WNzTJVIylVBrzwQmJABuABMzohE5h1PLhRqhYYISpt00M1mg1EC9lKiaFhne8FBMrdWhDrmf9ei
 STiDL7iaYzPgw==
X-Received: by 2002:a05:620a:4713:b0:93f:735:6c83 with SMTP id
 af79cd13be357-949ba9e9b76mr2492027685a.56.1795534617177; 
 Tue, 24 Nov 2026 07:36:57 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:36:56 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 0/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Date: Tue, 24 Nov 2026 10:36:51 -0500
Message-ID: <cover.1795527921.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
References: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:59:02 +0000
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jouni, Ville,

v3 with Jouni's review comments on v2 and the sashiko-bot findings.

It still uses frame updates as the trigger. Only non-flip flushes exit
Panel Replay; for ORIGIN_FLIP intel_psr_flush() jumps to rearm, so PR
stays enabled and does selective updates while the hook clears the bit.
That is the path the judder is on here, and v2 has been smoother than
the vblank version in daily use. Jouni prefers going back to vblank and
Ville objected to it in the RFC thread, so I'll leave the trigger to the
two of you and respin with whichever you agree on.

The frame update trigger is unchanged from v2, which has run daily on
7.4-rc3/rc4 on the Dell XPS 16 DA16260 (PTL, xe). The v3 changes are build
tested on drm-tip (W=1, i915 and xe, each patch).

Changes since v2:
- Use intel_dp->alpm.transcoder in the helper (Jouni)
- Compute disable_as_sdp_when_pr_active in
  intel_psr_compute_config_late() (Jouni)
- Don't set the bit at PR enable, start with the AS SDP sent and let the
  idle work suspend it (Jouni)
- Just stop setting the bit in intel_alpm_configure_pr_as_sdp() instead
  of keeping its value (Jouni), which also fixes a stale bit (sashiko)
- Update the latched setting on a seamless VRR toggle (sashiko)

Jake Steinman (4):
  drm/i915/alpm: Add a helper to suspend the AS SDP in PR Active
  drm/i915/psr: Send the AS SDP in PR Active while frames are updating
  drm/i915/alpm: Leave AS SDP Transmission in Active Disable to PSR code
  drm/i915/display: Remove the Panel Replay quirk for Dell XPS 16
    DA16260

 drivers/gpu/drm/i915/display/intel_alpm.c     |  44 ++++++-
 drivers/gpu/drm/i915/display/intel_alpm.h     |   4 +
 .../drm/i915/display/intel_display_types.h    |   5 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 120 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
 drivers/gpu/drm/i915/display/intel_quirks.c   |   8 --
 6 files changed, 165 insertions(+), 18 deletions(-)

-- 
2.56.1

