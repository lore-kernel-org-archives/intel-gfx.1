Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87049CA9ED1
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2026 10:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01D010E554;
	Mon, 12 Oct 2026 10:28:53 +0000 (UTC)
Received: from sonic313-20.consmr.mail.ir2.yahoo.com
 (sonic313-20.consmr.mail.ir2.yahoo.com [77.238.179.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEDE10EBD3
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2026 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791800926; bh=NHUA6B6fIFVOWm7fH/uRmcNljhi6CHAfKmk/98dk6uQ=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=NEfKENweHMSP71gVca1At1pu29LAmB3ktlcb7g3xU1lgp1hDVk6REsKfWSPBd8SRmWSrFW1XnjH/K/2M2Jk//bdcb1qnoUWN+wK3QO+N5ZDO095hf2u8gLQJ/AF/9FSUgJSf9krx4dQaELsrtJ/2HutBLdQGrr007LiQdcJeRR14rQ+W5XwpoUNvmH4O651N4+Dx98keFbOQeN2dfsGbrHeMwCdlY+P22fZBRw+5rXsDi+v0/IK7thVCF7vZrpECCwGpW4mfTrsbFtLX1nyxsdbdgrPbwaAFcznQZzHYq8Hc2z139tGl1SNlNXJ8KIg7NPSQGlHvvXko/U1pEBvqug==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791800926; bh=Y4LeuAbGoFJYNl4uFe2R00FREVodynfYSE9K9EihY40=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=bu8rXyRn9Uo0y413ok2n8fHoKGzGulRWNXX5NCOTnGd/Oa2fbx/i/ze8/8aj8Aprdorg+hSAwSxlwcAVOPlGoIUoe88RJLvBWlxgqXR2TNHsa7+6LSFxevRYXQtmh2F80ykXipCvYgbatcFikB320bM9A3g3CYKoyBceoEuUCJ1BkcykNR3jSQ7XEKlxy6XS5miESD4EUG7sINR84GbQC5OcRaQqJeS2AYGNS5yophQdonCUzyNCUaRLn2LmUHUSicB8BARfzvoydiv50sWeC6uOBmEc7mWHUy9IqKi78Gz+L13CO5o7SArlUP0eLTSS8YXAEXb/LIhysO0tBtPHBg==
X-YMail-OSG: X9cBWsYVM1lAya0m6NVI33I39kQG2n8Eqy7G.js8WhwMcBwtPRf.NF43qHUqkPG
 aYbEYekiTmb_ThkCDA6IFUQyGcmLSqsH6XggURFvNixMSnZq88Pgh81z.wu7bxlf1NQTAY2cqy2s
 QrU_OeV0w4qTdGSyi7nkmSl2juIGmSQwdrFIm0r27ee.45lAZxqnG1NEsPVi1mFTOy8ioJ0KKtm5
 9xc2uzAE.o.aevLZj13.He8QAc_ZZuSai_ZGhW5KUzNQ3MN.HX.rtn1ecd1ib9Eov1pd6speaUpu
 x09PDM9JEuEJLFD11uMMWoUXp3zvrmsT551GCtVp1W8CmCASbemzBehDyFr2IDQ_PxYNsNbuYQeF
 Jfiq9LbVKKwLKlY1hw5CbFfXtzxFosrxz8yBVwRcxZT0ijcbale4QmbecaZlmj7add503f4yWJLW
 Yta3op4DB3cCBiiYQUtV1rXhZso0aRgVuEysh7dtOyURWTiJ8PiVPxOvW.lkFNM1Xv6TwTOdLNLh
 bTDO7_nWlDW5MgHynBiHlLvEUIPkD6ogNfXVF7ual6GNTFbwLOxM3MyXYTplw9IOHCHHtdKgOvwL
 q8Puzi_p_4Jc.zWSVvo_o0jQQZjAY3ZYb.BQBuWwn1v3pDytbotlDvJeMpkqjfqMaXzX.NeyAdVZ
 fdv4zvwXb_W6.gHOwnr4w._dWF2FyQxugCZTJr9het1ZvMmJMohIwWbokzQpbRJduWiGf0.uBRo8
 fgFKskm0nfCnFqyIuW0eHHN6MU2.yNaqCdphvZ3RT90cRGn8fVieTZBc8Phy.LGGxVC_wgOrt0me
 n5RJMmSY2zPANlX3U9prXWVlDf7Z4AcxwCH5rB0tsSiWJzi6JCl2yzy8wcQo6tCFXTISR1QiLXG2
 eoYIdIVUA5JQ6YvpL09C16Ks6aZmrpREWSx1GDOBNZ00ex9gyZUy4EaDsyw_9hoR2P3zXyMorp96
 xFQFYo32QJhUo0290uIlljorcRAe49nyaV3VSkmf.BNDu1hW1glXFOk_3kgt78DT83BFL8tDS76D
 T.7tapb7f.ddvcu8DVYj4Tl22uZATR7ybEzI_fSCeEkvCBVCLeC0_Pbfc6iLdVA4SUmmH6hAY2BU
 VX495Lct_oIBWGLf2NZ44sSZxcyvKWUu0.9kIYAjkfCmO4P.PTeUnKVaBdlMUCxAXvRJf2n.66jr
 6hREhahXTj.r.bSZRTYiRykO8NmtntxWugD.7DG0LuqgDeMA.PuOEe1C2d8jx4IzbFyXtTE2N7ze
 ltXGF5QZynwvwW1D.DtZtF5TX5f4DBikgDKBb.Id6kC8qpntx.IcnGeghmhjSQmpM5.bUfDt0e_u
 xINdDbCXkEQ_0ROKG2hup2RlqA0f5xf7obyvKCotoNKPeUeAMFfLn_hwFUfFYS067Pxx26HP8Eb9
 S.J5oEJ0S07ZeTiuHI9A8zs4Ss4o1KqYgaAkK_4gq5lrr6IqEyv92Zp68gZ0zJ7R7AynCYSj.Sw8
 LrkiZxAAm7XsIHQg1HI_4Obi6CDWi9F0_7ey.mxHUATTW_jJX3SOZQbvHq9j8K_D3yy5kq4oA.Xz
 ZGwyvaaaqIksF_QYeK9IVoYoRhlg0EmOlu3_1FENDOCFDPlRW2iaGCz43jB5a4QNQ84vw8tq_myl
 lWFUxMuf0e3TMlN3B6EUjVACdV8SossYLEESCIqtWknlooYxNeh9RenDKS0cbB7vhEKUrKL0B_qO
 hFt2sMlRT_xfqw1oukiu3CGQVBYpWwDkqnv.SRdX5iOwTLzyjAUBm63q3tFqUKDvQU5GCoRt_KI2
 T.ZXDaRIlHfIp9HNZaNuOI0oxLC_SuDrSd.etlJEQvbMYl5UFyHo5hUdzYbnpTlov8971aeBv5lF
 yquZrnHMNmN1efQ.tqan7yNbdbkOaFtKBg_PcH2AUEJejM4H6p7TgoOkLzClMjR_wkOq8c8VxICZ
 zzg5FJoRzNd4m22TXh4uWv.0Je.3Nc7WJSXevrTTWfMYsySmtXmhd7sw22I6lCmWoaysxYp.LvAq
 IeTPPtgq73I_7RQ43INv_GGk7Fm_drwPXmbNt2R31ElGclfMqXHyhDA2cznlMN7hqMAncFaiMfzE
 TMgOUMarFrSxu1RvjTvyR6TmahkyF3R4A_r2URMxcHCndu4BQG9wFrUcPP6iuDKGm4aMUytBSssZ
 aeC0R.Q4iVX8UrKamjfLM.v2aQ9CcS5WEOBEpDJ62xj4BdUNeQVJV5w5SlFxsqenEbxF56riEzT6
 a1JPrQbJQ6j9xdJ8zJFvw5Vq7JeLPrxoj2kOF8CUJreEutABxSo6l9jmHlFdtTTwmGrWRaRvvpaf
 4ehSuJZxgeczqvRR6q3rRozm3Fo3OPtG1W4A-
X-Sonic-MF: <jp_2422-git@yahoo.com>
X-Sonic-ID: e92e34c0-7ab9-4c52-942b-1a42bbef5e2e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Mon, 12 Oct 2026 10:28:46 +0000
Date: Mon, 12 Oct 2026 10:28:45 +0000 (UTC)
From: "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Message-ID: <430187401.2957463.1791800925104@mail.yahoo.com>
In-Reply-To: <2058729485.143579.1791461606363@mail.yahoo.com>
References: <348041964.128703.1791459745347.ref@mail.yahoo.com>
 <348041964.128703.1791459745347@mail.yahoo.com>
 <fd77de823c5d30b4587676a7a71962f517979616@intel.com>
 <2058729485.143579.1791461606363@mail.yahoo.com>
Subject: Fw: adlp_tc_phy_connect [i915] floods logs with
 drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
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

As an alternative proposal, would you consider accepting the patch below, since the voluminous logging all originates from this line.

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f2d86b29c..1c32c3221 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -930,7 +930,7 @@ static bool adlp_tc_phy_connect(struct intel_tc_port *tc, int required_lanes)
}

if (!tc_phy_is_ready(tc) &&
- !drm_WARN_ON(display->drm, tc->mode == TC_PORT_LEGACY)) {
+ !drm_WARN_ON_ONCE(display->drm, tc->mode == TC_PORT_LEGACY)) {
drm_dbg_kms(display->drm, "Port %s: PHY not ready\n",
tc->port_name);
goto out_release_phy;

Currently a complete stack trace and register dump is logged into dmesg by drm_WARN_ON every time the phantom tc phy port isn't in the expected state. This occurs not only at i915_init, but also during i915 fbdev setup, i915 fbdev client hotplug, as well as any syscall passing through drm_helper_probe_single_connector_modes. 

Would using drm_WARN_ON_ONCE be sufficient for logging purposes here?

Example times when drm_WARN_ON is currently generated for this condition:-
Frequency of Occurence Description Path
Once Initial encoder setup during i915_init i915_init->...intel_bios_for_each_encoder->...->intel_ddi_init->intel_tc_port_init -> intel_tc_port_init_mode-> ..-> intel_tc_port_reset_mode -> tc_phy_connect -> adlp_tc_phy_connect
Once Initial fbdev setup i915_init ->..intel_fbdev_setup->...drm_helper_probe_single_connector_modes->intel_dp_detect->..-> intel_tc_port_reset_mode -> tc_phy_connect -> adlp_tc_phy_connect
Some i915 fb dev client hotplug drm_fbdev_client_hotplug->...drm_helper_probe_single_connector_modes->intel_dp_detect->..-> intel_tc_port_reset_mode -> tc_phy_connect -> adlp_tc_phy_connect
Many other syscalls resulting in probing modes drm_ioctl..->drm_mode_get_connector->drm_helper_probe_single_connector_modes->intel_dp_detect->..-> intel_tc_port_reset_mode -> tc_phy_connect -> adlp_tc_phy_connect

After the patch above, there is much reduced logging (observed during a 10 minute period)
grep drm_WARN_ON dmesg_pre_fix.txt | wc -l
5
grep drm_WARN_ON dmesg_post_fix.txt | wc -l
1

Full dmesg available at https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12246

----- Forwarded Message -----

From: jp_2422-git@yahoo.com <jp_2422-git@yahoo.com>
To: intel-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>; Jani Nikula <jani.nikula@linux.intel.com>
Sent Thursday, 8 October 2026 at 13:13:26 BST
Subject: Re: adlp_tc_phy_connect [i915] floods logs with drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces


Ok, thanks. I 'll keep it just as a private fix in the absence a suitable bios update.


On Thursday, 8 October 2026 at 12:49:19 BST, Jani Nikula <jani.nikula@linux.intel.com> wrote: 





On Thu, 08 Oct 2026, "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com> wrote:
> The issue discussed at https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12246 affects a number of laptops and Bios combinations, and appears to be the result of buggy Bios'es where the Intel VBT table is listing non-existent Display Ports on Alder Lake laptops.
>
> The following patch skips the creation of the non-existent port early
> on in intel_ddi_init(), so preventing the logs from being flooded with
> the warnings. It uses a new i915 display parameter to allow the user
> to select the type c port to skip with a boot option, and fixes the
> problem. Please can you advise whether you would accept this patch.

Thanks for the patch, but sorry, module parameters aren't the solution
to work around issues.

BR,
Jani.

<snip>
..
</snip>
